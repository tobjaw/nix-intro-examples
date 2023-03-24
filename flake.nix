{
  description = "Nix Introduction: Flake (Simple)";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11"; };

  outputs = { self, nixpkgs }: {
    packages.aarch64-darwin.default =
      nixpkgs.legacyPackages.aarch64-darwin.hello;
  };
}
