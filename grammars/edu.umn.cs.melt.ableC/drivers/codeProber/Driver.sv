grammar edu:umn:cs:melt:ableC:drivers:codeProber ;

imports edu:umn:cs:melt:ableC:concretesyntax as cst;
imports edu:umn:cs:melt:ableC:abstractsyntax:host;

imports silver:langutil;
imports silver:langutil:pp;

import edu:umn:cs:melt:ableC:abstractsyntax:env;

import edu:umn:cs:melt:ableC:drivers:compile;

function driver
IO<Decorated Compilation> ::= args::[String]
  theParser::(ParseResult<cst:Root>::=String String)
{
  -- Note that CodeProber supplies the file name as the last argument
  local fileName :: String = last(args);
  local splitFileName :: Pair<String String> = splitFileNameAndExtension(fileName);
  local baseFileName :: String = splitFileName.fst;
  local skipCpp :: Boolean = contains("--skip-cpp", args);
  local cppFileName :: String = if skipCpp then fileName else baseFileName ++ ".i";

  local partitionedArgs :: Pair<[String] [String]> = partition( partitionArg, init(args) );
  local cppArgs :: [String] = partitionedArgs.snd;
  local xcArgs :: [String] = partitionedArgs.fst;
  
  local cppOptions :: String = if length(args) >= 2 then implode(" ", cppArgs) else "" ;
  local cppCmd :: String = "gcc -E -x c -D _POSIX_C_SOURCE=200908L -std=gnu1x -I . " ++ cppOptions;
  local fullCppCmd :: String = cppCmd ++ " \"" ++ fileName ++ "\" > " ++ cppFileName;
  
  return do {
    when_(null(args),
      fail("Usage: [ableC invocation] [file name] [c preprocessor arguments]\n"));
    isF::Boolean <- isFile(fileName);
    when_(!isF,
      fail("File \"" ++ fileName ++ "\" not found.\n"));
    when_(contains("--show-cpp", args),
      print("CPP command: " ++ fullCppCmd ++ "\n"));
    mkCppFile::Integer <-
      if skipCpp then returnIO(0)
      else system(fullCppCmd);
    when_(mkCppFile != 0,
      fail("CPP call failed: " ++ fullCppCmd ++ "\n"));
    text :: String <- readFile(cppFileName);
    let result :: ParseResult<cst:Root> = theParser(text, cppFileName);
    when_(!result.parseSuccess, fail(result.parseErrors ++ "\n"));
    eprintln("Decorating parse tree...");
    return
      decorate compilation(result.parseTree.ast) with {
        env = addEnv( map(xcArgDef, xcArgs) , emptyEnv() );
      };
  };
}
