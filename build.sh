#!/usr/bin/env bash

set -e

rm -rf local
mkdir local

spack location -i systemc cxxstd=17 > /dev/null
spack location -i cmake > /dev/null

export CMAKE_PREFIX_PATH=$(spack location -i systemc cxxstd=17)
export PATH=${PATH}:$(spack location -i cmake)/bin/

pushd local
cmake ..
make -j `nproc`
make -j `nproc` check
popd

printf "\nBuild complete\n"
