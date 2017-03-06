#!/bin/bash

source $ABLEC_PATH/extensions/string/init_build.sh
source $ABLEC_PATH/extensions/templating/init_build.sh

export ABLEC_SOURCE+=" $ABLEC_PATH/extensions/vector/edu.umn.cs.melt.exts.ableC.vector/**/*"
export SILVER_INCLUDES+=" -I $ABLEC_PATH/extensions/vector"
export TRANSLATE_DEPENDS+=" $ABLEC_PATH/extensions/vector/include/*"
export CPPFLAGS+=" -I$ABLEC_PATH/extensions/vector/include"
