{
  description = "claude-languages — Claude Code LSP plugin marketplace";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          name = "claude-languages";

          packages = with pkgs; [
            jq # JSON manifest validation (mirrors CI)
            check-jsonschema # schema validation (mirrors CI)
            git
            gh # GitHub CLI
            go # Go toolchain (for testing gopls)
            gopls # Go language server
          ];
        };
      }
    );
}
