# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
{ pkgs, ... }: {
  programs.bat = {
    enable = true;

    config = {
      map-syntax = [
        "*.jenkinsfile:Groovy"
        "*Jenkinsfile*:Groovy"
      ];
    };

    extraPackages = with pkgs.bat-extras; [
      batdiff
      batgrep
      batman
    ];

    syntaxes = { };

    themes = { };
  };
}
