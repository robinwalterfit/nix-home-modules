# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
_: {
  programs.nix-index = {
    enable = true;

    # Shell integration
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };
}
