{
  inputs = {
    nixpkgs.follows = "silver/nixpkgs";
    silver.url =
      "github:melt-umn/silver/7636cd6d3a2ba06bffc371f5c79c57f593a02918";
  };
  outputs = { self, flake-utils, nixpkgs, silver }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        devShells.default = pkgs.mkShell {
          inputsFrom = builtins.attrValues packages;
          nativeBuildInputs = [ ];
        };

        packages = {
          default = packages.ableC;
          ableC = silver.legacyPackages.${system}.mkSilverBin {
            pname = "ableC";
            version =
              if (self ? rev) then self.shortRev else self.dirtyShortRev;
            src = ./.;

            grammarName = "edu:umn:cs:melt:ableC:compiler";
            javaFlags = [ "-Xss8M" ];

            nativeBuildInputs = [ pkgs.makeWrapper ];
            preFixup = ''
              wrapProgram $out/bin/ableC \
                --prefix PATH : "${pkgs.stdenv.cc}/bin"
            '';
          };
        };
      });
}
