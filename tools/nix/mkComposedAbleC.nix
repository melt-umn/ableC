{ ableC, lib, mkSilverBin, writeTextDir }:

extensions:

let
  extensionGrammarNames =
    lib.concatMapStringsSep "\n  " (grammarName: "${grammarName};")
    (builtins.concatMap (extension: extension.grammarNames) extensions);

  extensionBulletPoints =
    lib.concatMapStringsSep "\n" (extension: "- ${extension.name}") extensions;

  self = mkSilverBin {
    name = "ableC-composed";

    src = writeTextDir "grammars/artifact/Artifact.sv" ''
      grammar artifact;
      import edu:umn:cs:melt:ableC:concretesyntax as cst;
      import edu:umn:cs:melt:ableC:drivers:compile;
      parser extendedParser :: cst:Root {
        edu:umn:cs:melt:ableC:concretesyntax;
        ${extensionGrammarNames}
      }

      function main
      IOVal<Integer> ::= args::[String] io_in::IOToken
      { return driver(args, io_in, extendedParser); }
    '';

    binaryName = "ableC";
    grammarName = "artifact";
    javaFlags = [ "-Xss8M" ];
    silverInputs = [ ableC ] ++ extensions;

    meta = ableC.meta // {
      longDescription = ''
        ableC extended with:

        ${extensionBulletPoints}
      '';
    };
  };

in self
