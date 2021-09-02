#!/usr/bin/env bash

set -e

rm -rf local
mkdir local

export CMAKE_PREFIX_PATH=$(spack location -i systemc)
export PATH=${PATH}:$(spack location -i cmake)/bin/

pushd local
cmake ..
make -j `nproc`
make -j `nproc` check
popd

printf "\nBuild complete\n"
