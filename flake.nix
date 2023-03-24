{
  description = "Nix Introduction: Package Shell Scripts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        packages = rec {
          default = moo;
          moo = pkgs.writeShellScriptBin "moo" ''
            ${pkgs.hello}/bin/hello | ${pkgs.cowsay}/bin/cowsay
          '';
        };
      });
}
