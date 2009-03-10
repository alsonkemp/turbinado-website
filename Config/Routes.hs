module Config.Routes where

routes = [ "/:controller/:action/:id.:format"
         , "/:controller/:action/:id"
         , "/:controller/:action.:format"
         , "/:controller/:action"
         , "/:controller"
         , "/home"
         ]
