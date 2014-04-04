grammar edu:umn:cs:melt:ableC:drivers:parseAndPrint ;

imports edu:umn:cs:melt:ableC:concretesyntax as cst;
imports edu:umn:cs:melt:ableC:abstractsyntax as abs;

imports silver:langutil;
imports silver:langutil:pp;

function driver
IOVal<Integer> ::= args::[String] ioIn::IO 
  theParser::(ParseResult<cst:Root>::=String String)
{
  local fileName :: String = head(args);
  local splitFileName :: Pair<String String> = splitFileNameAndExtension(fileName);
  local baseFileName :: String = splitFileName.fst;
  local cppFileName :: String = baseFileName ++ ".gen_cpp";
  local ppFileName :: String = baseFileName ++ ".pp_out.c";
  
  local isF :: IOVal<Boolean> = isFile(fileName, ioIn);

  -- Run C pre processor over the file.
  local mkCppFile :: IOVal<Integer> =
    system("cpp -E -C \"" ++ fileName ++ "\" > " ++ cppFileName, isF.io);

  -- Read the output of CPP and parse it.
  local text :: IOVal<String> = readFile(cppFileName, mkCppFile.io);

  local result :: ParseResult<cst:Root> = theParser(text.iovalue, cppFileName);

  local ast :: abs:Root = result.parseTree.ast;

  local writePP :: IO = writeFile(ppFileName, show(80, ast.pp), text.io);

  return if !isF.iovalue then
    ioval(print("File \"" ++ fileName ++ "\" not found.\n", isF.io), 1)
  else if mkCppFile.iovalue != 0 then
    ioval(print("CPP call failed.\n", mkCppFile.io), 3)
  else if !result.parseSuccess then
    ioval(print(result.parseErrors ++ "\n", text.io), 2)
  else if !null(ast.errors) then
    ioval(print(messagesToString(ast.errors) ++ "\n", text.io), if containsErrors(ast.errors, false) then 4 else 0)
  else
    ioval(writePP, 0);
}

