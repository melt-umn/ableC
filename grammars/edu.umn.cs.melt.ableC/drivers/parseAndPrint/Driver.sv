grammar edu:umn:cs:melt:ableC:drivers:parseAndPrint ;

imports edu:umn:cs:melt:ableC:concretesyntax as cst;
imports edu:umn:cs:melt:ableC:abstractsyntax:host as abs;

imports silver:langutil;
imports silver:langutil:pp;

import edu:umn:cs:melt:ableC:abstractsyntax:env ; --only env, emptyEnv;

function driver
IOVal<Integer> ::= args::[String] ioIn::IO 
  theParser::(ParseResult<cst:Root>::=String String)
{
  local fileName :: String = head(args);
  local splitFileName :: Pair<String String> = splitFileNameAndExtension(fileName);
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
  
  local result::IOMonad<Integer> = do (bindIO, returnIO) {
    if null(args) then {
      printM("Usage: [ableC invocation] [file name] [c preprocessor arguments]\n");
      return 5;
    } else {
      isF::Boolean <- isFileM(fileName);
      if !isF then {
        printM("File \"" ++ fileName ++ "\" not found.\n");
        return 1;
      } else {
        if contains("--show-cpp", args) then
          printM("CPP command: " ++ fullCppCmd ++ "\n");
        mkCppFile::Integer <-
          if skipCpp then returnIO(0)
          else systemM(fullCppCmd);
        if mkCppFile != 0 then {
          printM("CPP call failed: " ++ fullCppCmd ++ "\n");
          return 3;
        } else {
          text :: String <- readFileM(cppFileName);
          result :: ParseResult<cst:Root> = theParser(text, cppFileName);
          if !result.parseSuccess then {
            printM(result.parseErrors ++ "\n");
            return 2;
          } else {
            comp :: Decorated abs:Compilation =
              decorate abs:compilation(result.parseTree.ast) with {
                env = addEnv( map(xcArgDef, xcArgs) , emptyEnv() );
              };
            if contains("--show-ast", args) then {
              printM(substitute("edu:umn:cs:melt:", "", hackUnparse(comp.abs:srcAst)) ++ "\n");
              return 0;
            }
            else if contains("--show-host-ast", args) then {
              printM(substitute("edu:umn:cs:melt:", "", hackUnparse(comp.abs:hostAst)) ++ "\n");
              return 0;
            }
            else if contains("--show-pp", args) then {
              printM(show(100, comp.abs:srcPP) ++ "\n");
              return 0;
            }
            else if contains("--show-host-pp", args) then {
              printM(show(100, comp.abs:hostPP) ++ "\n");
              return 0;
            }
            else {
              if !null(comp.errors) then
                printM(messagesToString(comp.errors) ++ "\n");
              if contains("--force-trans", args) || !containsErrors(comp.errors, false) then
                writeFileM(ppFileName, show(80, comp.abs:finalPP));
              if containsErrors(comp.errors, true) then
                return 4;
              else
                return 0;
            }
          }
        }
      }
    }
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


