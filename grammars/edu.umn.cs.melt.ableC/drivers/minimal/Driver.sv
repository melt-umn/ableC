{- A simpler driver made to be hooked into gcc via -no-integrated-cpp -wrapper.
   The preprocessor has already been run on our input, and cc1 is scheduled to
   be run on our output, so we don't need most of the other drivers.
 -}

grammar edu:umn:cs:melt:ableC:drivers:minimal;

imports edu:umn:cs:melt:ableC:concretesyntax as cst;
imports edu:umn:cs:melt:ableC:abstractsyntax:host as abs;

imports silver:langutil;
imports silver:langutil:pp;

import edu:umn:cs:melt:ableC:abstractsyntax:env;

fun driver IO<Integer> ::= args::[String] parse::(ParseResult<cst:Root> ::= String String) = do {
  if length(args) != 2 then do {
    eprintln("Usage: [ableC invocation] <input-path> <output-path>");
    return 100;
  } else do {
    let srcPath :: String = head(args);
    let dstPath :: String = head(tail(args));

    src :: String <- readFile(srcPath);
    let result :: ParseResult<cst:Root> = parse(src, srcPath);
    if !result.parseSuccess then do {
      eprintln(result.parseErrors);
      return 1;
    } else do {
      let comp :: Decorated abs:Compilation =
        decorate abs:compilation(result.parseTree.ast) with {
          env = emptyEnv();
        };
      let hasErrors :: Boolean = containsErrors(comp.errors, false);
      unless(null(comp.errors),
        eprintln(messagesToString(comp.errors)));
      unless(hasErrors,
        writeFile(dstPath, show(80, comp.abs:finalPP)));
      return if hasErrors then 2 else 0;
    };
  };
};
