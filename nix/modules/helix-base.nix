# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
{ pkgs, ... }:
{
  programs.helix = {
    enable = true;

    defaultEditor = true;
    extraConfig = "";
    extraPackages = with pkgs; [ marksman ];

    languages = { };

    settings = { };

    themes = { };
  };
}
