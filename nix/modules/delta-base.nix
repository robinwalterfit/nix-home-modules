# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
_: {
  programs.delta = {
    enable = true;

    enableGitIntegration = true;

    options = {
      dark = true; # Set to false if you're in a terminal w/ a light background color (e.g. the default macOS terminal)
      hyperlinks = true;
      line-numbers = true;
      navigate = true; # Use n and N to move between diff sections
      side-by-side = true;
    };
  };
}
