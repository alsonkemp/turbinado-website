module Config.App (
  useLowerCasePaths,
  customSetupFilters,
  customPreFilters,
  customPostFilters,
  logLevel
  ) where

import System.Log.Logger


import Turbinado.Controller.Monad
import Turbinado.Environment.Types
import Turbinado.Environment.Session.CookieSession

----------------------------------------------------------------
-- Environment settings
----------------------------------------------------------------

-- | Determines whether the server uses URLs of the form FooBar/BimBam or foo_bar/bim_bam.
-- The Controllers and Views must still be named FooBar.hs and BimBam.hs.
useLowerCasePaths = True

----------------------------------------------------------------
-- Session settings
----------------------------------------------------------------
sessionOpts = [ ("cookie-name", "turb-sess")
              , ("cipher-key",  "super secret phrase")
              ]

----------------------------------------------------------------
-- RequestHandler Filter List additions
----------------------------------------------------------------

customSetupFilters :: [Controller ()]
customSetupFilters  = []
customPreFilters   :: [Controller ()]
customPreFilters    = [retrieveSession sessionOpts]
customPostFilters  :: [Controller ()]
customPostFilters   = [persistSession  sessionOpts]


----------------------------------------------------------------
-- Logging
----------------------------------------------------------------
logLevel = DEBUG -- DEBUG < INFO < NOTICE < WARNING < ERROR < CRITICAL < ALERT < EMERGENCY 


