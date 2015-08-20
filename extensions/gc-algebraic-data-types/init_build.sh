#!/bin/bash

source $ABLEC_PATH/extensions/gc/init_build.sh
source $ABLEC_PATH/extensions/algebraic-data-types/init_build.sh

export ABLEC_SOURCE+=" $ABLEC_PATH/extensions/gc-algebraic-data-types/edu.umn.cs.melt.exts.ableC.gcadt/**/*"
export SILVER_INCLUDES+=" -I $ABLEC_PATH/extensions/gc-algebraic-data-types"
