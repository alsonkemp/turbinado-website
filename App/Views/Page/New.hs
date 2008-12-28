markup= <div>
          <form action=(getViewDataValue_u "save-url" :: View String) method="post">
            <div>
              Title: 
              <input type="text" id="title" name="title" />
              </div>
              <div>
              Content:
              <textarea rows="25" cols="126" name="content" id="content" />
            </div>
            <input type="submit" value="Save"/>
          </form>
        </div>
