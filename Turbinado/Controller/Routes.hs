-----------------------------------------------------------------------------
-- |
-- Module      :  Turbinado.Controller.Routes
-- Copyright   :  (c) Alson Kemp 2009
-- License     :  BSD-style (see the file LICENSE)
-- 
-- Maintainer  :  Alson Kemp (alson@alsonkemp.com)
-- Stability   :  experimental
-----------------------------------------------------------------------------
module Turbinado.Controller.Routes (
	respondTo
  ) where

import Data.Maybe
import Turbinado.Environment.Settings
import Turbinado.Controller.Monad

-- | Automates the process of responding to various file formats
respondTo :: String -> [(String,  Controller ())] -> Controller ()
respondTo f'' actions = do f' <- getSetting f''
                           case f' of
                             Nothing -> error $ "Routes.respondTo: There is no setting called '" ++ f'' ++ "' for me to respondTo"
                             Just f  -> do let a' = lookup f actions
                                           clearLayout
                                           oldAction <- getSetting_u "action"
                                           setSetting "action" (oldAction ++ f)
                                           case a' of
                                             Nothing -> return ()
                                             Just a  -> do a 
