grammar edu:umn:cs:melt:exts:ableC:gc:mda_test;

import edu:umn:cs:melt:ableC:host;

copper_mda testGcMalloc(ablecParser) {
  edu:umn:cs:melt:exts:ableC:gc:gcMalloc;
}

copper_mda testGcRealloc(ablecParser) {
  edu:umn:cs:melt:exts:ableC:gc:gcRealloc;
}

--  -- TODO: Fix this
copper_mda testGcNew(ablecParser) {
  edu:umn:cs:melt:exts:ableC:gc:gcNew;
}

