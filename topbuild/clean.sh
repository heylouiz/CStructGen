#!/bin/bash

HERE=$(dirname "$(readlink "$0" -f)")
cd ..
rm -rf build
make clean
#${TOPBUILD_REFS_RESOURCES}/padtec.fw.rsc.build.cmake.common/scripts/clean.py $0 $*
