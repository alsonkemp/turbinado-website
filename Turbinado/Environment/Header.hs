module Turbinado.Environment.Header (
  module Turbinado.Environment.Header,
  module Network.HTTP.Headers
  ) where

import Data.Maybe
import qualified Network.HTTP as HTTP
import Network.HTTP.Headers

import Turbinado.Controller.Monad
import Turbinado.Environment.Types
import Turbinado.Environment.Request
import Turbinado.Utility.Data

-- | Attempts to pull a HTTP header value.
getHeader :: (HasEnvironment m) => HeaderName -> m (Maybe String)
getHeader h = do e <- getEnvironment
                 return $ findHeader h (fromJust' "Header: getHeader" $ getRequest e)

-- | Unsafe version of getHeader.  Fails if the key is not found.
getHeader_u :: (HasEnvironment m) => HeaderName -> m String
getHeader_u h = do h' <- getHeader h
                   maybe (error $ "getHeader_u : key does not exist - \"" ++ (show h) ++ "\"")
                         return
                         h'

