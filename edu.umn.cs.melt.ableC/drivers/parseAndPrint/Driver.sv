grammar edu:umn:cs:melt:ableC:drivers:parseAndPrint ;

imports edu:umn:cs:melt:ableC:concretesyntax as cst;
imports edu:umn:cs:melt:ableC:abstractsyntax as abs;

imports silver:langutil;
imports silver:langutil:pp;
imports core:monad;

import edu:umn:cs:melt:ableC:abstractsyntax:env ; --only env, emptyEnv;

function driver
IOVal<Integer> ::= args::[String] ioIn::IO 
  theParser::(ParseResult<cst:Root>::=String String)
{
  local fileName :: String = head(args);
  local splitFileName :: Pair<String String> = splitFileNameAndExtension(fileName);
  local baseFileName :: String = splitFileName.fst;
  local cppFileName :: String = baseFileName ++ ".gen_cpp";
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
        if containsBy(stringEq, "--show-cpp", args) then
          printM("CPP command: " ++ fullCppCmd ++ "\n");
        mkCppFile::Integer <-
          systemM(
          fullCppCmd);
        if mkCppFile != 0 then {
          printM("CPP call failed.\n");
          return 3;
        } else {
          text :: String <- readFileM(cppFileName);
          result :: ParseResult<cst:Root> = theParser(text, cppFileName);
          if !result.parseSuccess then {
            printM(result.parseErrors ++ "\n");
            return 2;
          } else {
            ast :: Decorated abs:Root =
              decorate result.parseTree.ast with {
                env = addEnv( map(xcArgDef, xcArgs) , emptyEnv() );
              };
            hostAst :: Decorated abs:Root = decorate ast.abs:host with { env = ast.env; };
            liftedAst :: Decorated abs:Root = decorate ast.abs:lifted with { env = ast.env; };
            if containsBy(stringEq, "--show-ast", args) then {
              printM(substitute("edu:umn:cs:melt:", "", hackUnparse(hostAst)) ++ "\n");
              return 0;
            }
            else if containsBy(stringEq, "--show-host-ast", args) then {
              printM(substitute("edu:umn:cs:melt:", "", hackUnparse(hostAst)) ++ "\n");
              return 0;
            }
            else if containsBy(stringEq, "--show-lifted-ast", args) then {
              printM(substitute("edu:umn:cs:melt:", "", hackUnparse(liftedAst)) ++ "\n");
              return 0;
            }
            else if containsBy(stringEq, "--show-pp", args) then {
              printM(show(100, ast.pp) ++ "\n");
              return 0;
            }
            else if containsBy(stringEq, "--show-host-pp", args) then {
              printM(show(100, hostAst.pp) ++ "\n");
              return 0;
            }
            else if containsBy(stringEq, "--show-lifted-pp", args) then {
              printM(show(100, liftedAst.pp) ++ "\n");
              return 0;
            }
            else {
              errors::[Message] = 
                if !null(ast.errors)
                then ast.errors
                else if !null(hostAst.errors) -- host error checking dissabled for efficency reasons
                then wrn(loc("", -1, -1, -1, -1, -1, -1),
                         "Errors in host tree:") :: hostAst.errors
                else if !null(liftedAst.errors)
                then wrn(loc("", -1, -1, -1, -1, -1, -1),
                        "Errors in lifted tree:") :: liftedAst.errors
                else if !null(liftedAst.abs:globalDecls)
                then [wrn(loc("Top level", -1, -1, -1, -1, -1, -1),
                          "globalDecls at top level in lifted tree: " ++ implode(", ", map(fst, liftedAst.abs:globalDecls)))]
                else [];
              if !null(errors) then
                printM(messagesToString(errors) ++ "\n");
              if containsBy(stringEq, "--force-trans", args) || null(errors) then
                writeFileM(ppFileName, show(80, liftedAst.pp));
              if containsErrors(errors, false) then
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


