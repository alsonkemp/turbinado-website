import App.Models.PageModel

show :: Controller ()
show  = do id'  <- getSetting_u "id"
           p <- find id'
           setViewDataValue "page-title" (title p)
           setViewDataValue "page-content" (content p)

list :: Controller ()
list  = do pages <- findAllOrderBy "title"
           setViewDataValue "component-pages-list" $ map (\p -> (title p, _id p)) pages

listOnly :: Controller ()
listOnly = do prefix <- getSetting_u "pages-prefix"
              pages <- findAllWhereOrderBy "_id like ?" [toSql $ prefix ++ "%"] "title"
              setViewDataValue "component-pages-list" $ map (\p -> (title p, _id p)) pages
              setSetting "component-view" "List" -- use the view from the List action
