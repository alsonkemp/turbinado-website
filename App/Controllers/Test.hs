import qualified Network.URI as URI
import Data.Time

import Turbinado.Controller
import App.Models.Page
import App.Models.Tmp

show :: Controller ()
show  = do id'  <- getSetting_u "id"
           p <- find id'
           setViewDataValue "page-title" (title p)
           setViewDataValue "page-content" (content p)

index :: Controller ()
index = do clearLayout
           setViewDataValue "songs"
                    ["Sgt. Pepper's Lonely Hearts Club Band",
                     "With a Little Help from My Friends",
                     "Lucy in the Sky with Diamonds",
                     "Getting Better",
                     "Fixing a Hole",
                     "She's Leaving Home",
                     "Being for the Benefit of Mr. Kite!",
                     "Within You Without You",
                     "When I'm Sixty-Four",
                     "Lovely Rita",
                     "Good Morning Good Morning",
                     "Sgt. Pepper's Lonely Hearts Club Band (Reprise)",
                     "A Day in the Life"]

time :: Controller ()
time = do t1 <- liftIO getCurrentTime
          t2 <- liftIO getZonedTime
          let t = Tmp (Just t1) (Just t2)
          insert t False
          return ()
