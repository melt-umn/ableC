grammar edu:umn:cs:melt:ableC:drivers:test;

imports edu:umn:cs:melt:ableC:concretesyntax as cst;
imports edu:umn:cs:melt:ableC:abstractsyntax:host as abs;

imports silver:langutil;
imports silver:langutil:pp;

import edu:umn:cs:melt:ableC:abstractsyntax:env;

function runTest
IO<Boolean> ::= 
  theParser::(ParseResult<cst:Root>::=String String)
  fileName::String
{
  local splitFileName :: Pair<String String> = splitFileNameAndExtension(fileName);
  local baseFileName :: String = splitFileName.fst;
  local cppFileName :: String = baseFileName ++ ".gen_cpp";
  local ppFileName :: String = baseFileName ++ ".pp_out.c";
  local cppErrFileName :: String = baseFileName ++ ".cpp_errs";
  local errFileName :: String = baseFileName ++ ".errs";
  local cppCmd :: String = "gcc -E -x c -D _POSIX_C_SOURCE=200908L -std=gnu1x -I .";
  local fullCppCmd :: String = cppCmd ++ " \"" ++ fileName ++ "\" > " ++ cppFileName ++ " 2> " ++ cppErrFileName;

  local doBuild::EitherT<String IO ()> = do {
    mkCppFile::Integer <- lift(system(fullCppCmd));
    unless(mkCppFile == 0,
      fail("CPP call failed: " ++ fullCppCmd ++ "\n"));
    text :: String <- lift(readFile(cppFileName));
    let result :: ParseResult<cst:Root> = theParser(text, cppFileName);
    unless(result.parseSuccess,
      fail(result.parseErrors ++ "\n"));
    let comp :: Decorated abs:Compilation =
      decorate abs:compilation(result.parseTree.ast) with { env = emptyEnv(); };
    unless(null(comp.errors),
      fail(messagesToString(comp.errors) ++ "\n"));
    lift(writeFile(ppFileName, show(80, comp.abs:finalPP)));
  };

  return do {
    isF::Boolean <- isFile(fileName);
    unless(isF, fail("Test file not found: " ++ fileName));
    res::Either<String ()> <- doBuild.run;
    case res of
      | left(e) -> writeFile(errFileName, e)
      | _ -> pure(())
      end;
    println(s"- ${if res.isRight then "NO ERROR" else "ERROR   "}    ${fileName}");
    return res.isRight;
  };
}

function driver
IO<Integer> ::= theParser::(ParseResult<cst:Root>::=String String)  args::[String]
{
  local testFiles :: [String] = args;
  return do {
    results::[Boolean] <- sequence(map(runTest(theParser, _), testFiles));
    let numSuccess :: Integer = sum(map(toInteger, results));
    println(s"""

Summary:
  ${toString(length(testFiles) - numSuccess)} errored
  ${toString(numSuccess)} did not error
""");
    return 0;
  };
}
