# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
{
  description = "Reusable Home Manager Modules";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    # See: https://flake.parts/getting-started.html
    flake-parts.lib.mkFlake { inherit inputs; } (
      { self, ... }:
      let
        lib = import ./nix/lib.nix { inherit self; };

        homeModules = {
          bat-base = ./nix/modules/bat-base.nix;
          bottom-base = ./nix/modules/bottom-base.nix;
          broot-base = ./nix/modules/broot-base.nix;
          colima-base = ./nix/modules/colima-base.nix;
          direnv-base = ./nix/modules/direnv-base.nix;
          eza-base = ./nix/modules/eza-base.nix;
          fastfetch-base = ./nix/modules/fastfetch-base.nix;
          fd-base = ./nix/modules/fd-base.nix;
          git-base = ./nix/modules/git-base.nix;
          helix-base = ./nix/modules/helix-base.nix;
          htop-base = ./nix/modules/htop-base.nix;
          lazydocker-base = ./nix/modules/lazydocker-base.nix;
          micro-base = ./nix/modules/micro-base.nix;
          nix-index-base = ./nix/modules/nix-index-base.nix;
          nushell-base = ./nix/modules/nushell-base.nix;
          pandoc-base = ./nix/modules/pandoc-base.nix;
          rclone-base = ./nix/modules/rclone-base.nix;
          ripgrep-all-base = ./nix/modules/ripgrep-all-base.nix;
          ripgrep-base = ./nix/modules/ripgrep-base.nix;
          starship-base = ./nix/modules/starship-base.nix;
          zsh-base = ./nix/modules/zsh-base.nix;
        };
      in
      {
        systems = [ ];

        imports = [
          # Activate partitions
          flake-parts.flakeModules.partitions
        ];

        partitionedAttrs = {
          checks = "dev";
          devShells = "dev";
          formatter = "dev";
        };
        partitions = {
          dev = {
            extraInputsFlake = ./nix/dev;
            module =
              { ... }:
              {
                imports = [ ./nix/dev/flake-module.nix ];
              };
          };
        };

        flake = { inherit homeModules lib; };
      }
    );
}
