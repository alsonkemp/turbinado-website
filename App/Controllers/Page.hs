import qualified Network.URI as URI
import System.Time

import Turbinado.Controller
import App.Models.Page

index :: Controller ()
index  = do pages <- findAll
            setViewDataValue "pages-list" $ map (\p -> (title p, _id p)) pages

show :: Controller ()
show  = do id'  <- getSetting_u "id"
           p <- find id'
           setViewDataValue "page-title" (title p)
           setViewDataValue "page-content" (content p)

new :: Controller ()
new  = do  id'  <- getSetting_u "id"
           setViewDataValue "save-url" ("/Page/Create/" ++ id')

create :: Controller ()
create = do id'  <- getSetting_u "id"
            _title   <- getParam_u "title"
            _content <- getParam_u "content"
            App.Models.Page.insert Page {_id = id', title = _title, content = _content} False
            redirectTo $ "/Page/Show/" ++ id'

edit :: Controller ()
edit  = do id'  <- getSetting_u "id"
           p <- find id'
           setViewDataValue "save-url" ("/Page/Save/" ++ id')
           setViewDataValue "page-title" (title p)
           setViewDataValue "page-content" (content p)

save :: Controller ()
save = do   id'  <- getSetting_u "id"
            _title   <- getParam_u "title"
            _content <- getParam_u "content"
            p <- find id'
            App.Models.Page.update p {title = _title, content = _content}
            redirectTo $ "/Page/Show/" ++ id'

--test :: Controller ()
--test = do t <- liftIO getClockTime
--          App.Models.Page.insert Page {_id = "asdf7", title = "title", content = "content", tester = Just 666, ts = Just t} False
--          redirectTo $ "/Home/Index"

