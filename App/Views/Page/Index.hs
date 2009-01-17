markup= <div>
          <h1>
            Page Index
          </h1>
          <% do l <- getViewDataValue_u "pages-list" :: View [(String, String)]
                mapM indexItem l 
          %>
        </div>

indexItem (t,i) = return $ cdata $ unlines $
                   ["<div style='padding: 0pt 5px;'>"
                   ," <a href=\"/Page/Show/" ++ i ++"\">"
                   ,"  "++ t
                   ," </a>"
                   ,"</div>"
                   ]
