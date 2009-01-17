--
-- | A Posix.popen compatibility mapping.
--
-- If we use this, we should build -threaded
--
module System.Plugins.Process (exec, popen) where

import System.Exit
#if __GLASGOW_HASKELL__ >= 604
import System.IO
import System.Process
import Control.Concurrent       (forkIO)
#else
import qualified Posix as P
#endif

import qualified Control.Exception

--
-- slight wrapper over popen for calls that don't care about stdin to the program
--
exec :: String -> [String] -> IO ([String],[String])
exec f as = do
        (a,b,_) <- popen f as (Just [])
        return (lines a, lines b)

#if __GLASGOW_HASKELL__ >= 604

type ProcessID = ProcessHandle

--
-- Ignoring exit status for now.
--
-- XXX there are still issues. Large amounts of output can cause what
-- seems to be a dead lock on the pipe write from runplugs, for example.
-- Posix.popen doesn't have this problem, so maybe we can reproduce its
-- pipe handling somehow.
--
popen :: FilePath -> [String] -> Maybe String -> IO (String,String,ProcessID)
popen file args minput =
    Control.Exception.handle (\e -> return ([],show e,error (show e))) $ do

    (inp,out,err,pid) <- runInteractiveProcess file args Nothing Nothing

    case minput of
        Just input -> hPutStr inp input >> hClose inp -- importante!
        Nothing    -> return ()

    -- Now, grab the input
    output <- hGetContents out
    errput <- hGetContents err

    -- SimonM sez:
    -- ... avoids blocking the main thread, but ensures that all the
    -- data gets pulled as it becomes available. you have to force the
    -- output strings before waiting for the process to terminate.
    --
    forkIO (Control.Exception.evaluate (length output) >> return ())
    forkIO (Control.Exception.evaluate (length errput) >> return ())

    -- And now we wait. We must wait after we read, unsurprisingly.
    exitCode <- waitForProcess pid -- blocks without -threaded, you're warned.
    case exitCode of
      ExitFailure code
          | null errput -> let errMsg = file ++ ": failed with error code " ++ show code
                           in return ([],errMsg,error errMsg)
      _ -> return (output,errput,pid)

#else

--
-- catch so that we can deal with forkProcess failing gracefully.  and
-- getProcessStatus is needed so as not to get a bunch of zombies,
-- leading to forkProcess failing.
--
-- Large amounts of input will cause problems with blocking as we wait
-- on the process to finish. Make sure no lambdabot processes will
-- generate 1000s of lines of output.
--
popen :: FilePath -> [String] -> Maybe String -> IO (String,String,P.ProcessID)
popen f s m = 
        Control.Exception.handle (\e -> return ([], show e, error $ show e )) $ do
            x@(_,_,pid) <- P.popen f s m 
            b <- P.getProcessStatus True False pid  -- wait
            return $ case b of    
                Nothing -> ([], "process has disappeared", pid)
                _       -> x

#endif
