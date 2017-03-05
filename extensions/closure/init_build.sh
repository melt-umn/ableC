#!/bin/bash

source $ABLEC_PATH/extensions/gc/init_build.sh

export ABLEC_SOURCE+=" $ABLEC_PATH/extensions/closure/edu.umn.cs.melt.exts.ableC.closure/**/*"
export SILVER_INCLUDES+=" -I $ABLEC_PATH/extensions/closure"
