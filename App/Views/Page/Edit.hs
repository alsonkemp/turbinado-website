markup= <div>
          <script type="text/javascript" src="/js/tiny_mce/tiny_mce.js"></script>
          <script type="text/javascript">
            tinyMCE.init({
              mode : "exact",
              elements : "content",
              theme: "advanced",
              plugins : "safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager",
               // Theme options
               theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
               theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
               theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
               theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
               theme_advanced_toolbar_location : "top",
               theme_advanced_toolbar_align : "left",
               theme_advanced_statusbar_location : "bottom",
               theme_advanced_resizing : true
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
