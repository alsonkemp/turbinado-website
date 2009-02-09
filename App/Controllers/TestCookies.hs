import Turbinado.Controller

createCounter :: Controller ()
createCounter = do clearLayout
                   setCookie $ mkCookie "counter" (show 0)
                   setViewDataValue "show-me" "0"

incrementCounter :: Controller ()
incrementCounter = do clearLayout
                      c <- getCookie "counter"
                      case c of
                       Nothing -> do setCookie $ mkCookie "counter" (show 0)
                                     setViewDataValue "show-me" (0::Int)
                       Just c' -> do let ctr = read c' :: Int
                                     setCookie $ mkCookie "counter" (show $ ctr + 1)
                                     setViewDataValue "show-me" $ show (ctr+1) 

deleteCounter :: Controller ()
deleteCounter = do clearLayout
                   deleteCookie "counter"
                   setViewDataValue "show-me" "deleted"
