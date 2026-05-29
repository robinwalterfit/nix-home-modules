# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
_: {
  programs.eza = {
    enable = true;

    # Shell integration
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    # Automatically activate color
    colors = "auto";

    # Apply additional options
    extraOptions = [
      "--oneline"
      "--all"
      "--git-repos"
      "--group-directories-first"
      "--header"
      "--links"
      "--long"
      "--mounts"
      "--smart-group"
    ];

    # List each file's Git status
    git = true;

    # Automatically use icons
    icons = "auto";
  };
}
