#!/bin/bash

source $ABLEC_PATH/extensions/gc/init_build.sh # Don't really need everything, but loads gc library dependancies

export ABLEC_SOURCE+=" $ABLEC_PATH/extensions/string/edu.umn.cs.melt.exts.ableC.string/**/*"
export SILVER_INCLUDES+=" -I $ABLEC_PATH/extensions/string"
export TRANSLATE_DEPENDS+="$ABLEC_PATH/extensions/string/include/*"
export CPPFLAGS+=" -I$ABLEC_PATH/extensions/string/include"
