import qualified Network.URI as URI
import System.Time

import Turbinado.Controller
import App.Models.Page

show :: Controller ()
show  = do id'  <- getSetting_u "id"
           p <- find id'
           setViewDataValue "page-title" (title p)
           setViewDataValue "page-content" (content p)
           respondTo "format" []

