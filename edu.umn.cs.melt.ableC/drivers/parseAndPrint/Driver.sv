grammar edu:umn:cs:melt:ableC:drivers:parseAndPrint ;

imports edu:umn:cs:melt:ableC:concretesyntax as cst;
imports edu:umn:cs:melt:ableC:abstractsyntax as abs;

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
  local cppFileName :: String = baseFileName ++ ".gen_cpp";
  local ppFileName :: String = baseFileName ++ ".pp_out.c";

  local partitionedArgs :: Pair<[String] [String]> = partition( partitionArg, tail(args) );
  local cppArgs :: [String] = partitionedArgs.snd;
  local xcArgs :: [String] = partitionedArgs.fst;
  
  local isF :: IOVal<Boolean> = isFile(fileName, ioIn);

  local cppCmd :: String = "gcc -E -x c -D _POSIX_C_SOURCE -std=gnu1x -I . " ++
    cppOptions;
  local cppOptions :: String =
    if length(args) >= 2 then implode(" ", cppArgs) else "" ;

  -- Run C pre processor over the file.
  local fullCppCmd :: String = cppCmd ++ " \"" ++ fileName ++ "\" > " ++ cppFileName;
  local mkCppFile :: IOVal<Integer> =
    system(
      fullCppCmd,  
      if containsBy(stringEq, "--show-cpp", args)
      then print("CPP command: " ++ fullCppCmd ++ "\n", isF.io)
      else isF.io);

  -- Read the output of CPP and parse it.
  local text :: IOVal<String> = readFile(cppFileName, mkCppFile.io);

  local result :: ParseResult<cst:Root> = theParser(text.iovalue, cppFileName);

  local ast :: abs:Root = result.parseTree.ast;
  ast.env = addEnv( map(xcArgDef, xcArgs) , emptyEnv() );

  local hostAst :: abs:Root = ast.abs:host;
  hostAst.env = ast.env;
  
  local liftedAst :: abs:Root = hostAst.abs:lifted;
  liftedAst.env = hostAst.env;
  
  local errors::[Message] = 
    if !null(ast.errors)
    then ast.errors
    else {- if !null(hostAst.errors) -- host error checking dissabled for efficency reasons
    then wrn(loc("", -1, -1, -1, -1, -1, -1),
             "Errors in host tree:") :: hostAst.errors
    else-} if !null(liftedAst.errors)
    then wrn(loc("", -1, -1, -1, -1, -1, -1),
             "Errors in lifted tree:") :: liftedAst.errors
    else if !null(liftedAst.abs:globalDecls)
    then [wrn(loc("Top level", -1, -1, -1, -1, -1, -1),
              "globalDecls at top level in lifted tree: " ++ implode(", ", map(fst, liftedAst.abs:globalDecls)))]
    else [];

  local writePP :: IO = writeFile(ppFileName, show(80, liftedAst.pp), text.io);

  return if null(args) then
    ioval(print("Usage: [ableC invocation] [file name] [c preprocessor arguments]\n", ioIn), 5)
  else if !isF.iovalue then
    ioval(print("File \"" ++ fileName ++ "\" not found.\n", isF.io), 1)
  else if mkCppFile.iovalue != 0 then
    ioval(print("CPP call failed.\n", mkCppFile.io), 3)
  else if !result.parseSuccess then
    ioval(print(result.parseErrors ++ "\n", text.io), 2)
  else if containsBy(stringEq, "--show-ast", args) then
    ioval(print(substitute("edu:umn:cs:melt:", "", hackUnparse(ast)) ++ "\n", text.io), 0)
  else if containsBy(stringEq, "--show-host-ast", args) then
    ioval(print(substitute("edu:umn:cs:melt:", "", hackUnparse(hostAst)) ++ "\n", text.io), 0)
  else if containsBy(stringEq, "--show-lifted-ast", args) then
    ioval(print(substitute("edu:umn:cs:melt:", "", hackUnparse(liftedAst)) ++ "\n", text.io), 0)
  else if containsBy(stringEq, "--show-pp", args) then
    ioval(print(show(100, ast.pp) ++ "\n", text.io), 0)
  else if containsBy(stringEq, "--show-host-pp", args) then
    ioval(print(show(100, hostAst.pp) ++ "\n", text.io), 0)
  else if !null(errors) && (containsBy(stringEq, "--force-trans", args) || !containsErrors(errors, false)) then
    ioval(print(messagesToString(errors) ++ "\n", writePP), if containsErrors(errors, false) then 4 else 0)
  else if !null(errors) then
    ioval(print(messagesToString(errors) ++ "\n", text.io), 4)
  else
    ioval(writePP, 0);
}


function partitionArg
Boolean ::= arg::String
{
  return 
    arg=="--show-ast" ||
    arg=="--show-host-ast" ||
    arg=="--show-lifted-ast" ||
    arg=="--show-host-pp" ||
    arg=="--show-pp" ||
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


