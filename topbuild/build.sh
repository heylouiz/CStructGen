#!/bin/bash
HERE=$(dirname "$(readlink "$1" -f)")
BUILD_TARGET=$1
SRC_DIR=${HERE}/../${PROGNAME}
OUTPUT_DIR=$HERE/../build/dist/$BUILD_TARGET
BUILD_DIR=$HERE/../build/$TOPBUILD_RESOURCES_TOOLCHAIN_NAME/$BUILD_TARGET
TOOLCHAIN_BIN_PREFIX=${TOPBUILD_REFS_TOOLCHAIN}/bin/${TOPBUILD_RESOURCES_TOOLCHAIN_PREFIX}

AUTOMAKE_OUTPUT_DIR=${HERE}/../automake/build/dist/$BUILD_TARGET

if [ -z "${BUILD_TARGET}" ]; then
  echo "No target specified"
  exit 0
fi

if [ -z "$PKG_CONFIG_PATH" ]; then
  echo "No PKG_CONFIG_PATH specified!"
  #exit 0
fi

export CC=${CC:=${TOOLCHAIN_BIN_PREFIX}gcc}
export CXX=${CXX:=${TOOLCHAIN_BIN_PREFIX}g++}
export AR=${AR:=${TOOLCHAIN_BIN_PREFIX}ar}
export LDFLAGS+=" -L${TOPBUILD_REFS_TOOLCHAIN}/../../lib"
export CPPFLAGS+=" -I${TOPBUILD_REFS_TOOLCHAIN}/include"
export PATH=${TOPBUILD_REFS_TOOLCHAIN}/bin:$PATH

export CPQD_VERSION_CONTROL=0.0.0
export CPQD_VERSION_BRANCH_COMP=master

if [ "${BUILD_TARGET}" == "release" ]; then
  if [ "${TOPBUILD_RESOURCES_TOOLCHAIN_NAME}" == "padtec.fw.rsc.toolchain.gnu.x86_64.1" ] ||
     [ "${TOPBUILD_RESOURCES_TOOLCHAIN_NAME}" == "padtec.fw.rsc.toolchain.padlinux" ]; then
    cd ..

    mkdir -p ${OUTPUT_DIR}

    if [ "${TOPBUILD_RESOURCES_TOOLCHAIN_NAME}" == "padtec.fw.rsc.toolchain.padlinux" ]; then
      HOST_FLAG="--host=i586-padtec-linux"
    fi

    ./autogen.sh --prefix=${OUTPUT_DIR} ${HOST_FLAG}

    make install
  fi
fi
