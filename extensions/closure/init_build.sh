#!/bin/bash

export ABLEC_SOURCE+=" $ABLEC_PATH/extensions/closure/edu.umn.cs.melt.exts.ableC.closure/**/*"
export SILVER_INCLUDES+=" -I $ABLEC_PATH/extensions/closure"
export LDLIBS+=" -lgc"

if [ -f /project/melt/Software/setup_paths.sh ]
then
    source /project/melt/Software/setup_paths.sh
fi
