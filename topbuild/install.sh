#!/bin/sh
set -e

ID=$TOPBUILD_COMPONENT_ID
ROOT=$TOPBUILD_COMPONENT_ROOT
TARGET=$TOPBUILD_COMPONENT_TARGET
DIST=$ROOT/build/dist/$TARGET

if [ ! -d "$DIST" ]; then 
    echo -e "\t---"
    echo -e "\tComponent $ID has to be built."
    echo -e "\t---"
    exit 1
fi

# Prepares dest dir
DEST=$TOPBUILD_COMPONENT_INSTALL_PATH/opt/padtec
DEST_BIN=$DEST/bin
DEST_LIB=$DEST/lib
DEST_ETC=$DEST/etc/$ID
DEST_PKGS=$DEST/pkgs/$ID
install -d $DEST $DEST_BIN
