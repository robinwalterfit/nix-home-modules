# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
_: {
  programs.pandoc = {
    enable = true;

    citationStyles = [
      (builtins.fetchurl {
        url = "https://raw.githubusercontent.com/citation-style-language/styles/1ccf4696be22ea0b55f83cc9163bde3061fddb0a/ieee.csl";
        sha256 = "sha256-tMdhn8FsRaMeTMMnHquU/+gxktO0x/xylHCjtFlEjeM=";
      })
    ];

    templates = { };
  };
}
