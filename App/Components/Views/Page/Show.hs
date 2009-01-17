markup = <div class="page-content">
           <h1><% getViewDataValue_u "page-title" :: View String %></h1>
           <% (getViewDataValue_u "page-content" :: View String) >>= (return . cdata) %>
         </div>

