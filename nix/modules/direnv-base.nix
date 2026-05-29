# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
_: {
  programs.direnv = {
    enable = true;

    # Shell integration
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    # Nix Flake integration
    nix-direnv.enable = true;
  };
}
