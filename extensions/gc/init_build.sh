#!/bin/bash

export ABLEC_SOURCE+=" $ABLEC_PATH/extensions/gc/edu.umn.cs.melt.exts.ableC.gc/**/*"
export SILVER_INCLUDES+=" -I $ABLEC_PATH/extensions/gc"
export LDLIBS+=" -lgc"

if [ -f /project/melt/Software/setup_paths.sh ]
then
    source /project/melt/Software/setup_paths.sh
fi
