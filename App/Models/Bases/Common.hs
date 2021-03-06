{- DO NOT EDIT THIS FILE
   THIS FILE IS AUTOMAGICALLY GENERATED AND YOUR CHANGES WILL BE EATEN BY THE GENERATOR OVERLORD -}

module App.Models.Bases.Common(
  module App.Models.Bases.Common,
  module Control.OldException,
  module Control.Monad.Trans,
  module Data.Int
  ) where

import Control.Monad.Trans
import Control.OldException
import Database.HDBC
import Data.Int

import Turbinado.Environment.Types

-- Using phantom types here 
class DatabaseModel m where
  tableName :: m -> String

type SelectString = String
type SelectParams = [SqlValue]
type OrderByParams  = String

class (DatabaseModel model) =>
        IsModel model where
        insert    :: (HasEnvironment m) => model -> Bool -> m (Maybe Integer)
        findAll   :: (HasEnvironment m) => m [model]
        findAllWhere :: (HasEnvironment m) => SelectString -> SelectParams -> m [model]
        findAllOrderBy :: (HasEnvironment m) => OrderByParams -> m [model]
        findAllWhereOrderBy :: (HasEnvironment m) => SelectString -> SelectParams -> OrderByParams -> m [model]
        findOneWhere :: (HasEnvironment m) => SelectString -> SelectParams -> m model
        findOneOrderBy :: (HasEnvironment m) => OrderByParams -> m model
        findOneWhereOrderBy :: (HasEnvironment m) => SelectString -> SelectParams -> OrderByParams -> m model

class (DatabaseModel model) =>
        HasFindByPrimaryKey model primaryKey | model -> primaryKey where
    find   :: (HasEnvironment m) => primaryKey -> m model
    delete :: (HasEnvironment m) => primaryKey -> m ()
    update :: (HasEnvironment m) => model      -> m ()

