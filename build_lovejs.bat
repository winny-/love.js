@echo off
mkdir build

call C:\Users\Grigor\git\emsdk\emsdk_env

(
  cd build
  REM emcmake cmake C:\Users\Grigor\git\megasource -G "Unix Makefiles" -DLOVE_JIT=0 -DCMAKE_BUILD_TYPE=Release
  REM emmake make -j 6
  copy "love\love.js*" ..\src\release
  copy "love\love.wasm" ..\src\release
  copy "love\love.worker.js" ..\src\release
)
