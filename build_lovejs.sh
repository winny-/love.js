#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

mkdir -p build/release build/compat

source ~/Github/emsdk/emsdk_env.sh

(
  cd build/release
  emcmake cmake /home/alexjgriffith/Github/love.js/megasource -DLOVE_JIT=0 -DCMAKE_BUILD_TYPE=Release
  emmake make -j 6
  cp love/love.js* ../../src/release
  cp love/love.wasm ../../src/release
  cp love/love.worker.js ../../src/release
)

(
  cd build/compat
  emcmake cmake /home/alexjgriffith/Github/love.js/megasource -DLOVE_JIT=0 -DCMAKE_BUILD_TYPE=Release -DLOVEJS_COMPAT=1 -DSEXPORT_ALL=1 -DSMAIN_MODULE=1 -DSERROR_ON_UNDEFINED_SYMBOLS=0
  emmake make -j 6
  cp love/love.js* ../../src/compat
  cp love/love.wasm ../../src/compat
)
