module Config.Master (
        module Config.Master,
        module Config.App,
        module Config.Database
        ) where

import Config.App
import Config.Database

----------------------------------------------------------------
-- Arguments to the make system used in the Dynamic Loader
----------------------------------------------------------------
compileArgs = 
        [ "-fglasgow-exts"
        , "-XOverlappingInstances"
        , "-XUndecidableInstances"
        , "-F", "-pgmFtrturbinado"
        , "-fno-warn-overlapping-patterns"
        , "-odir " ++ compiledDir
        , "-hidir " ++ compiledDir
        , "-package HDBC"
        -- , "-keep-tmp-files"
        , "-O"
        ]

mUserPkgConf = [""]

----------------------------------------------------------------
-- Paths
----------------------------------------------------------------

layoutDir      = "App/Layouts"
layoutStub     = "Turbinado/Stubs/Layout.hs"
configDir = "Config"
modelDir       = "App/Models"
viewDir        = "App/Views"
viewStub       = "Turbinado/Stubs/View.hs"
controllerDir  = "App/Controllers"
controllerStub = "Turbinado/Stubs/Controller.hs"
componentViewDir        = "App/Components"
componentViewStub       = "Turbinado/Stubs/ComponentView.hs"
componentControllerDir  = "App/Components"
componentControllerStub = "Turbinado/Stubs/ComponentController.hs"

staticDirs = ["static", "tmp/cache"]
compiledDir = "tmp/compiled"

rootDir = "./"
