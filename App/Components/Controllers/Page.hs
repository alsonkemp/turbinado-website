import Turbinado.Controller
import App.Models.Page

show :: Controller ()
show  = do id'  <- getSetting_u "id"
           p <- find id'
           setViewDataValue "page-title" (title p)
           setViewDataValue "page-content" (content p)

list :: Controller ()
list  = do pages <- findAllOrderBy "_id"
           setViewDataValue "component-pages-list" $ map (\p -> (title p, _id p)) pages

listOnly :: Controller ()
<<<<<<< HEAD:App/Components/Controllers/Page.hs
listOnly = do prefix <- getSetting_u "pages-prefix" :: Controller String
              pages <- findAllWhereOrderBy "_id like ?" [toSql $ prefix ++ "%"] "_id"
=======
listOnly = do prefix <- getSetting_u "pages-prefix"
              pages <- findAllWhereOrderBy "_id like ?" [toSql $ prefix ++ "%"] "title"
>>>>>>> 765e0ae686c48f0146e555e92ed507e4964e87a9:App/Components/Controllers/Page.hs
              setViewDataValue "component-pages-list" $ map (\p -> (title p, _id p)) pages
              setSetting "component-view" "List" -- use the view from the List action
