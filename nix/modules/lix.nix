# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
{ pkgs, ... }:
{
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    settings = {
      extra-trusted-public-keys = [ "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o=" ];
      extra-trusted-substituters = [ "https://cache.lix.systems" ];
    };
  };

  nixpkgs = {
    overlays = [
      (final: prev: {
        inherit (prev.lixPackageSets.stable)
          colmena
          nix-eval-jobs
          nix-fast-build
          nixpkgs-review
          ;
      })
    ];
  };
}
