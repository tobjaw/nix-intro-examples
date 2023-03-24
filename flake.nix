{
  description = "Nix Introduction: Package any app";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        packages = rec {
          default = hello;
          hello = pkgs.stdenv.mkDerivation {
            name = "hello";
            src = ./.;
            buildInputs = [ pkgs.gcc ];
            buildPhase = "gcc -o hello ./hello.c";
            installPhase = ''
              mkdir -p $out/bin
              cp ./hello $out/bin
            '';
          };
        };
      });
}
