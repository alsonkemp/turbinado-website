import Turbinado.Controller

createCounter :: Controller ()
createCounter = do clearLayout
                   setSessionValue "counter" "0"
                   setViewDataValue "show-me" "0"

incrementCounter :: Controller ()
incrementCounter = do clearLayout
                      e <- getEnvironment
                      setViewDataValue "show-session" $ show $ fromJust $ getSession e
                      c <- getSessionValue "counter"
                      case c of
                       Nothing -> setViewDataValue "show-me" "No counter found in session"
                       Just c' -> do let ctr = read c' :: Int
                                     setSessionValue "counter" (show $ ctr + 1)
                                     setViewDataValue "show-me" $ show (ctr+1) 

deleteCounter :: Controller ()
deleteCounter = do clearLayout
                   deleteSessionKey "counter"
                   setViewDataValue "show-me" "deleted"
