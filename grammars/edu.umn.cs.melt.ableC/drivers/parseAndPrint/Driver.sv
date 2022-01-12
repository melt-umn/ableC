grammar edu:umn:cs:melt:ableC:drivers:parseAndPrint ;

imports edu:umn:cs:melt:ableC:concretesyntax as cst;
imports edu:umn:cs:melt:ableC:abstractsyntax:host as abs;

imports silver:langutil;
imports silver:langutil:pp;

import edu:umn:cs:melt:ableC:abstractsyntax:env ; --only env, emptyEnv;

function driver
IOVal<Integer> ::= args::[String] ioIn::IOToken 
  theParser::(ParseResult<cst:Root>::=String String)
{
  local fileName :: String = head(args);
  local splitFileName :: Pair<String String> = splitFileNameAndExtensionT(fileName);
  local baseFileName :: String = splitFileName.fst;
  local skipCpp :: Boolean = contains("--skip-cpp", args);
  local cppFileName :: String = if skipCpp then fileName else baseFileName ++ ".gen_cpp";
  local ppFileName :: String = baseFileName ++ ".pp_out.c";

  local partitionedArgs :: Pair<[String] [String]> = partition( partitionArg, tail(args) );
  local cppArgs :: [String] = partitionedArgs.snd;
  local xcArgs :: [String] = partitionedArgs.fst;
  
  local cppOptions :: String = if length(args) >= 2 then implode(" ", cppArgs) else "" ;
  local cppCmd :: String = "gcc -E -x c -D _POSIX_C_SOURCE -std=gnu1x -I . " ++ cppOptions;
  local fullCppCmd :: String = cppCmd ++ " \"" ++ fileName ++ "\" > " ++ cppFileName;
  
  local result::IO<Integer> = do {
    if null(args) then do {
      print("Usage: [ableC invocation] [file name] [c preprocessor arguments]\n");
      return 5;
    } else do {
      isF::Boolean <- isFile(fileName);
      if !isF then do {
        print("File \"" ++ fileName ++ "\" not found.\n");
        return 1;
      } else do {
        when_(contains("--show-cpp", args),
          print("CPP command: " ++ fullCppCmd ++ "\n"));
        mkCppFile::Integer <- if skipCpp then returnIO(0) else system(fullCppCmd);
        if mkCppFile != 0 then do {
          print("CPP call failed: " ++ fullCppCmd ++ "\n");
          return 3;
        } else do {
          text :: String <- readFile(cppFileName);
          let result :: ParseResult<cst:Root> = theParser(text, cppFileName);
          if !result.parseSuccess then do {
            print(result.parseErrors ++ "\n");
            return 2;
          } else do {
            let comp :: Decorated abs:Compilation =
              decorate abs:compilation(result.parseTree.ast) with {
                env = addEnv( map(xcArgDef, xcArgs) , emptyEnv() );
              };
            if contains("--show-ast", args) then do {
              print(substitute("edu:umn:cs:melt:", "", hackUnparse(comp.abs:srcAst)) ++ "\n");
              return 0;
            } else if contains("--show-host-ast", args) then do {
              print(substitute("edu:umn:cs:melt:", "", hackUnparse(comp.abs:hostAst)) ++ "\n");
              return 0;
            } else if contains("--show-pp", args) then do {
              print(show(100, comp.abs:srcPP) ++ "\n");
              return 0;
            } else if contains("--show-host-pp", args) then do {
              print(show(100, comp.abs:hostPP) ++ "\n");
              return 0;
            } else do {
              unless(null(comp.errors),
                print(messagesToString(comp.errors) ++ "\n"));
              when_(contains("--force-trans", args) || !containsErrors(comp.errors, false),
                writeFile(ppFileName, show(80, comp.abs:finalPP)));
              return if containsErrors(comp.errors, true) then 4 else 0;
            };
          };
        };
      };
    };
  };
  
  return evalIO(result, ioIn);
}


function partitionArg
Boolean ::= arg::String
{
  return 
    arg=="--show-ast" ||
    arg=="--show-host-ast" ||
    arg=="--show-lifted-ast" ||
    arg=="--show-pp" ||
    arg=="--show-host-pp" ||
    arg=="--show-lifted-pp" ||
    arg=="--show-cpp" ||
    arg=="--force-trans" ||
    arg=="--skip-cpp" ||
    startsWith("--xc-", arg) ;
}

-- From an arg, create the environment Def that indicates its presence
-- Note that no value is stored in the env for this.
-- ToDo: Add ability to add a value for these xc arguments.
function xcArgDef
Def ::= arg::String
{ return miscDef(arg,emptyMiscItem()); }



{-
function removeNonCppArgs
[String] ::= args::[String]
{
  return case args of
           [] -> []
         | "--show-ast" :: rest -> removeNonCppArgs(rest)
         | arg :: rest -> arg :: removeNonCppArgs(rest)
         end;
}
-}


