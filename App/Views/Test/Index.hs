markup = <div>
           <h1>Songs</h1>
           <table>
             <% do ss <- getViewDataValue_u "songs" :: View [String]
                   mapM genRow ss %>
           </table>
         </div>

genRow s = <tr> 
            <td>
              <% show s %>
            </td> 
           </tr>

