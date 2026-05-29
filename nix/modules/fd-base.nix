# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
_: {
  programs.fd = {
    enable = true;

    extraOptions = [ ];

    hidden = true;

    ignores = [
      ".git/"
      "*.bak"
    ];
  };
}
