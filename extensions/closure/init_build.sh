#!/bin/bash

source ../gc/init_build.sh

export ABLEC_SOURCE+=" $ABLEC_PATH/extensions/closure/edu.umn.cs.melt.exts.ableC.closure/**/*"
export SILVER_INCLUDES+=" -I $ABLEC_PATH/extensions/closure"
export TRANSLATE_DEPENDS+="$ABLEC_PATH/extensions/closure/include"
export CPPFLAGS+=" -I$ABLEC_PATH/extensions/closure/include"
