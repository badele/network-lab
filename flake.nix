{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = with pkgs;
          mkShell {
            packages = [ bats containerlab d2 just ];
            shellHook = ''
              export PROJ="Network lab"

              echo ""
              echo "⭐ Welcome to the $PROJ project ⭐"
              echo ""
            '';
          };
      });
}
