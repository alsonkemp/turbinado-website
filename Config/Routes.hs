module Config.Routes where

import App.Controllers.Home
import App.Controllers.Develop

--
-- Import modules for which you'll be creating static routes.
--

--
-- Configure dynamic routes for on-the-fly compiled-and-loaded
-- modules (ala Rails)
--
routes = [ "/:controller/:action/:id.:format"
         , "/:controller/:action/:id"
         , "/:controller/:action.:format"
         , "/:controller/:action"
         , "/:controller"
         , "/home"
         ]

--
-- Statically compile and load these Layouts, Controllers and Views
--
staticLayouts =
    []

staticControllers = 
    [ ("App/Controllers/Home.hs",    "index", App.Controllers.Home.index)
    , ("App/Controllers/Develop.hs", "index", App.Controllers.Develop.index)
    ]

staticViews =
    []
