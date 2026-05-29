# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    literalExpression
    literalMD
    mkMerge
    mkOption
    mkOrder
    types
    ;

  cfg = config.robinwalterfit.nix-home-modules.zsh;
in
{
  options.robinwalterfit.nix-home-modules.zsh = {
    initExtraFirst = mkOption {
      default = "";
      description = literalMD "Content to be added to the head of `.zshrc`";
      type = types.lines;
    };

    initExtraBeforeCompInit = mkOption {
      default = "";
      description = literalMD "Content to be added before `comp init` in `.zshrc`";
      type = types.lines;
    };

    initExtra = mkOption {
      default = ''
        # User local binaries
        export PATH="$PATH:$HOME/.local/bin"
      '';
      description = literalMD "Content to be added to `.zshrc`";
      type = types.lines;
    };

    initExtraLast = mkOption {
      default = "";
      description = literalMD "Content to be added at the end of `.zshrc`";
      example = literalExpression ''
        # Run fastfetch only in interactive shells
        if [[ $- == *i* ]]; then
          ''${lib.getExe pkgs.fastfetch}
        fi
      '';
      type = types.lines;
    };
  };

  config = {
    programs.zsh = {
      enable = true;
      autocd = true;

      # Autosuggestions
      autosuggestion = {
        enable = true;
        strategy = [ "history" ];
      };

      # Completion
      enableCompletion = true;

      # Extra environment variables => .zshenv
      envExtra = "";

      # History: path, size, sharing, prevent duplicates
      history = {
        append = true;
        expireDuplicatesFirst = true;
        # Timestamps & duration
        extended = true;
        findNoDups = true;
        ignoreAllDups = true;
        ignoreDups = true;
        # Do not save command with leading spaces
        ignoreSpace = true;
        path = "${config.xdg.dataHome}/zsh/history";
        save = 100000;
        # Do not save duplicates
        saveNoDups = true;
        # Share history between live sessions
        share = true;
        size = 100000;
      };

      historySubstringSearch.enable = true;

      # Content to be added to .zshrc
      initContent =
        let
          initExtraFirst = mkOrder 500 cfg.initExtraFirst;
          initExtraBeforeCompInit = mkOrder 550 cfg.initExtraBeforeCompInit;
          initExtra = mkOrder 1000 cfg.initExtra;
          initExtraLast = mkOrder 1500 cfg.initExtraLast;
        in
        mkMerge [
          initExtraFirst
          initExtraBeforeCompInit
          initExtra
          initExtraLast
        ];

      # Configure additional plugins
      plugins = [
        # Configure completion sync - updates zsh completions when direnv loads devshell
        {
          file = "share/zsh-completion-sync/zsh-completion-sync.plugin.zsh";
          name = "zsh-completion-sync";
          src = pkgs.zsh-completion-sync;
        }
      ];

      # Configure zsh options
      setOptions = [
        "HIST_REDUCE_BLANKS"
        # Allow tab completion in the middle of a word
        "COMPLETE_IN_WORD"
      ];

      # Configure aliases
      shellAliases = { };

      # Syntax Highlighting
      syntaxHighlighting.enable = true;
    };
  };
}
