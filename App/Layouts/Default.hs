module App.Layouts.Default where

import Turbinado.Layout
import Control.Monad.Trans
import Data.List
import Data.Maybe
import qualified Network.HTTP as HTTP
import qualified Network.URI  as URI

markup = 
         <html>
          <head>
            <meta name="verify-v1" content="w8VesxPmDH0sX71+bZUok+LyY0eDG5aM6v8odpbkEm8=" />
            <title>Turbinado: MVC Framework for Haskell</title>
            <meta name="keywords" content="turbinado, haskell, mvc, model, view, controller, ruby, rails"/>
            <meta name="description" content="Turbinado is a Model-View-Controller-ish web framework written in Haskell.  Ruby On Rails comes to Haskell."/>
            <% styleSheetTag "normalize" "screen" %>
            <% styleSheetTag "pressurized" "screen" %>
            <% styleSheetTag "turbinado" "screen" %>
            <% javaScriptFile "jquery" %>
            <% javaScriptFile "jsddm" %>
            <% googleAnalytics "UA-6158816-1" %>
          </head>
          <body>
            <div id="wrapper">
              <div id="header">
                <div id="logo">
                  <h1>
                    <a href="http://www.turbinado.org">
                      <img src="/images/turbinado.jpg" />
                      <span style="left:140px; position:absolute; top:65px;">
                        Turbinado
                      </span>
                    </a>
                  </h1>
                </div>
              </div>
              <div id="menu">
                <ul>
                  <% menuItem "/Home/Index"                      "Home" %>
                  <% menuItem "/Home/Performance"                "Performance" %>
                  <% menuItem "/Architecture/Show/architecture"  "Architecture" %>
                  <% menuItem "/Home/Install"                    "Install" %>
                  <% menuItem "/Tutorial/Show/tutorial"          "Tutorial" %>
                  <% menuItem "/Develop/Index"                   "Develop" %>
                </ul>
              </div>
              <div id="page">
                <div id="view">
                  <% insertDefaultView %>
                </div>
              </div>
              <div style="clear: both;" />
            </div>
            <div id="footer">
              <p>Copyright (c) 2008 Turbinado.org. All rights reserved.</p>
              <p>Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
            </div>
          </body>
         </html>

menuItem :: FilePath -> String -> VHtml
menuItem p t = do e <- getEnvironment
                  let ru = HTTP.rqURI $ fromJust $ getRequest e
                      active = if isPrefixOf p (URI.uriPath ru) then "active" else ""
                  %li
                    %a{href=p}= t

