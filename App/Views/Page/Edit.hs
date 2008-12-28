markup= <div>
          <script type="text/javascript" src="/js/tiny_mce/tiny_mce.js"></script>
          <script type="text/javascript">
            tinyMCE.init({
              mode : "exact",
              elements : "content"
            });
          </script>

          <form action=(getViewDataValue_u "save-url" :: View String) method="post">
            <div>
              Title: 
              <input type="text" id="title" name="title" value=(getViewDataValue_u "page-title" :: View String) />
              </div>
              <div>
              Content:
              <textarea rows="25" cols="126" name="content" id="content">
                <% getViewDataValue_u "page-content" :: View String %>
              </textarea>
            </div>
            <input type="submit" value="Save"/>
          </form>
        </div>
