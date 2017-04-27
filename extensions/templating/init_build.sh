#!/bin/bash

export ABLEC_SOURCE+=" $ABLEC_PATH/extensions/templating/edu.umn.cs.melt.exts.ableC.templating/**/*"
export SILVER_INCLUDES+=" -I $ABLEC_PATH/extensions/templating"
export LDLIBS+=" -lm"
