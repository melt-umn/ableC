{- Improving the ableC driver.

The `parseAndPrint` driver does a fine job of translating extended C
(.xc) programs down to plain C, but it may be nice to provide a driver
that does more, specifically compiling the generated C code.  The names
that `parseAndPrint` choses for generated files are also a bit clumsy.

We may also set up this driver to support flags to indicate how much
work it is to do, so it could subsume parseAndPrint.

We might also take some inspriation for gcc for flag names.

Possible flags:

 -i = stop after running CPP, create a .i file

 -xc = stop after processing .i file, create a .c file
    This is what parseAndPrint does now.
    To prevent overwriting pre-existing C file, this phase should
    add "//ableC generated C file: <timestamp>"
    as the first line of the generated C file.  We can then check that
    any C file we would overwrite has this line and thus know it is
    OK to do so.

 -c = stop after running gcc, create a .o file

 <no flag> = go all the way, run gcc to create executable
    The  name is the basename of the input file name.
    e.g.  for `foobar.xc` we create executable `foobar`

 -save-temps - don't delete intermediate files

 -v, -vv = verbosity settings
    It's be nice to not display so much information when things work!
    -v - just display the commands being executed
         - cpp, java -jar ableC.jar, gcc -c, gcc
    -vv - all the stuff Silver pumps out now.  This would requiring
      changing Silver's behavior.

 Some existing flags that are probably OK.  The --show-X for trees, e.g.c
  
 -}

grammar edu:umn:cs:melt:ableC:drivers:compile ;

imports edu:umn:cs:melt:ableC:concretesyntax as cst;
imports edu:umn:cs:melt:ableC:abstractsyntax:host as abs;

imports silver:langutil;
imports silver:langutil:pp;

import edu:umn:cs:melt:ableC:abstractsyntax:env;

function driver
IOVal<Integer> ::= args::[String] ioIn::IO 
  theParser::(ParseResult<cst:Root>::=String String)
{
  local fileName :: String = head(args);
  local splitFileName :: Pair<String String> = splitFileNameAndExtension(fileName);
  local baseFileName :: String = splitFileName.fst;
  local skipCpp :: Boolean = contains("--skip-cpp", args);
  local cppFileName :: String = if skipCpp then fileName else baseFileName ++ ".i";
  local ppFileName :: String = baseFileName ++ ".c";

  local partitionedArgs :: Pair<[String] [String]> = partition( partitionArg, tail(args) );
  local cppArgs :: [String] = partitionedArgs.snd;
  local xcArgs :: [String] = partitionedArgs.fst;
  
  local cppOptions :: String = if length(args) >= 2 then implode(" ", cppArgs) else "" ;
  local cppCmd :: String = "gcc -E -x c -D _POSIX_C_SOURCE=200908L -std=gnu1x -I . " ++ cppOptions;
  local fullCppCmd :: String = cppCmd ++ " \"" ++ fileName ++ "\" > " ++ cppFileName;
  
  local result::IOMonad<Integer> = do {
    if null(args) then do {
      printM("Usage: [ableC invocation] [file name] [c preprocessor arguments]\n");
      return 5;
    } else do {
      isF::Boolean <- isFileM(fileName);
      if !isF then do {
        printM("File \"" ++ fileName ++ "\" not found.\n");
        return 1;
      } else do {
        when_(contains("--show-cpp", args),
          printM("CPP command: " ++ fullCppCmd ++ "\n"));
        mkCppFile::Integer <-
          if skipCpp then returnIO(0)
          else systemM(fullCppCmd);
        if mkCppFile != 0 then do {
          printM("CPP call failed: " ++ fullCppCmd ++ "\n");
          return 3;
        } else do {
          text :: String <- readFileM(cppFileName);
          let result :: ParseResult<cst:Root> = theParser(text, cppFileName);
          if !result.parseSuccess then do {
            printM(result.parseErrors ++ "\n");
            return 2;
          } else do {
            let comp :: Decorated abs:Compilation =
              decorate abs:compilation(result.parseTree.ast) with {
                env = addEnv( map(xcArgDef, xcArgs) , emptyEnv() );
              };
            if contains("--show-ast", args) then do {
              printM(substitute("edu:umn:cs:melt:", "", hackUnparse(comp.abs:srcAst)) ++ "\n");
              return 0;
            } else if contains("--show-host-ast", args) then do {
              printM(substitute("edu:umn:cs:melt:", "", hackUnparse(comp.abs:hostAst)) ++ "\n");
              return 0;
            } else if contains("--show-pp", args) then do {
              printM(show(100, comp.abs:srcPP) ++ "\n");
              return 0;
            } else if contains("--show-host-pp", args) then do {
              printM(show(100, comp.abs:hostPP) ++ "\n");
              return 0;
            } else do {
              unless(null(comp.errors),
                printM(messagesToString(comp.errors) ++ "\n"));
              when_(contains("--force-trans", args) || !containsErrors(comp.errors, false),
                writeFileM(ppFileName, show(80, comp.abs:finalPP)));
              return if containsErrors(comp.errors, false) then 4 else 0;
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


