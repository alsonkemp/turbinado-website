module Config.Routes where

import App.Controllers.HelloWorld

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
    [
      ("App/Layouts/Default.hs",    "index", App.Layout.Default.markup)
    ]

staticControllers = 
    [ 
      ("App/Controller/HelloWorld.hs",    "index", App.Controllers.HelloWorld.index)
    ]

staticViews =
    [
      ("App/Views/HelloWorld/Index.hs",    "index", App.Views.HelloWorld.index)
    ]
