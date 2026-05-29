# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
_: {
  programs.wezterm = {
    enable = true;

    # Shell integration
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
