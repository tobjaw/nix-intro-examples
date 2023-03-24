{
  description = "Nix Introduction: Go Module";

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
          hello = pkgs.buildGoModule {
            pname = "main";
            version = self.lastModifiedDate;
            subPackages = [ "./main.go" ];
            src = ./.;
            vendorSha256 = null;
          };
        };
      });
}
