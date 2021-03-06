{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_acronym (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,7,0,11] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/knight/Exercism/haskell/acronym/.stack-work/install/x86_64-linux-tinfo6/c6f3af6d4073d98c2f30b981da21bbe9e24b94650f86e7ae787b71b220322ab8/8.10.7/bin"
libdir     = "/home/knight/Exercism/haskell/acronym/.stack-work/install/x86_64-linux-tinfo6/c6f3af6d4073d98c2f30b981da21bbe9e24b94650f86e7ae787b71b220322ab8/8.10.7/lib/x86_64-linux-ghc-8.10.7/acronym-1.7.0.11-HYIWhruXZNo2mTiol0S5Vm-test"
dynlibdir  = "/home/knight/Exercism/haskell/acronym/.stack-work/install/x86_64-linux-tinfo6/c6f3af6d4073d98c2f30b981da21bbe9e24b94650f86e7ae787b71b220322ab8/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/knight/Exercism/haskell/acronym/.stack-work/install/x86_64-linux-tinfo6/c6f3af6d4073d98c2f30b981da21bbe9e24b94650f86e7ae787b71b220322ab8/8.10.7/share/x86_64-linux-ghc-8.10.7/acronym-1.7.0.11"
libexecdir = "/home/knight/Exercism/haskell/acronym/.stack-work/install/x86_64-linux-tinfo6/c6f3af6d4073d98c2f30b981da21bbe9e24b94650f86e7ae787b71b220322ab8/8.10.7/libexec/x86_64-linux-ghc-8.10.7/acronym-1.7.0.11"
sysconfdir = "/home/knight/Exercism/haskell/acronym/.stack-work/install/x86_64-linux-tinfo6/c6f3af6d4073d98c2f30b981da21bbe9e24b94650f86e7ae787b71b220322ab8/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "acronym_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "acronym_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "acronym_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "acronym_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "acronym_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "acronym_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
