grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

terminal GNU_Thread_t '__thread' lexer classes {Keyword, Reserved};

concrete productions top::StorageClassSpecifier_c
| '__thread'
    { top.isTypedef = false;
      top.storageClass = [ast:threadLocalStorageClass()]; }
