#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

mkdir build

source ~/git/emsdk/emsdk_env.sh

(
  cd build
  emcmake cmake /Users/dkhachat/git/megasource -DLOVE_JIT=0 -DCMAKE_BUILD_TYPE=Release
  emmake make -j 6
  cp love/love.js* ../../src/release
  cp love/love.wasm ../../src/release
  cp love/love.worker.js ../../src/release
)
