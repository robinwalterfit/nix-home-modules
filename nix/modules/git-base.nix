# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
{ pkgs, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    lfs = {
      enable = true;
      package = pkgs.git-lfs;
      skipSmudge = false;
    };

    settings = {
      core.autocrlf = "input";
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
      merge = {
        conflictstyle = "zdiff3";
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
