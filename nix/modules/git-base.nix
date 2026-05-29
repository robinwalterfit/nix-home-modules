# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    lfs = {
      enable = true;
      package = pkgs.git-lfs;
      skipSmudge = false;
    };

    settings = {
      core = {
        autocrlf = "input";
        pager = "delta";
      };
      delta = {
        light = false; # set to true if you're in a terminal w/ a light background color (e.g. the default macOS terminal)
        line-numbers = true;
        navigate = true; # use n and N to move between diff sections
        side-by-side = true;
      };
      diff = {
        colorMoved = "default";
      };
      fetch = {
        all = true;
        prune = true;
        tags = true;
      };
      format = {
        signoff = true;
      };
      init = {
        defaultBranch = "main";
      };
      interactive = {
        diffFilter = "delta --color-only";
      };
      merge = {
        conflictstyle = "diff3";
      };
      pull = {
        rebase = true;
      };
      push = {
        autoSetupRemote = true;
        followTags = false;
      };
    };
  };
}
