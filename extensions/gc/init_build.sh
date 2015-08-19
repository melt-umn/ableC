#!/bin/bash

export ABLEC_SOURCE+=" $ABLEC_PATH/extensions/gc/edu.umn.cs.melt.exts.ableC.gc/**/*"
export SILVER_INCLUDES+=" -I $ABLEC_PATH/extensions/gc"
export LDLIBS+=" -lgc"
