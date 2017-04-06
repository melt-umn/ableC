#!/bin/bash

export ABLEC_SOURCE+=" $ABLEC_PATH/extensions/string/edu.umn.cs.melt.exts.ableC.string/**/*"
export SILVER_INCLUDES+=" -I $ABLEC_PATH/extensions/string"
export TRANSLATE_DEPENDS+=" $ABLEC_PATH/extensions/string/include/*"
export CPPFLAGS+=" -I$ABLEC_PATH/extensions/string/include"
export LDLIBS+=" -lgc"

if [ -f /project/melt/Software/setup_paths.sh ]
then
    source /project/melt/Software/setup_paths.sh
fi
