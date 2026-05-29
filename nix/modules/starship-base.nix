# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
{ lib, ... }:
{
  programs.starship = {
    enable = true;

    # Shell integration
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      add_newline = true;
      continuation_prompt = "[▸▹ ](dimmed white)";

      format = lib.concatStrings [
        "[░▒▓](#A3AED2)"
        "[$os](bg:#A3AED2 fg:#090C0C)"
        "[](bg:#769ff0 fg:#a3aed2)"
        "$directory"
        "[](fg:#769ff0 bg:#394260)"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$git_metrics"
        "[](fg:#394260 bg:#212736)"
        "$cmd_duration"
        "[](fg:#212736 bg:#1d2230)"
        "$time"
        "[ ](fg:#1d2230)"
        "\n[$nix_shell$container ](dimmed white)$jobs$sudo$username$hostname$localip$shlvl$shell$env_var$character"
      ];

      right_format = lib.concatStrings [
        "$singularity"
        "$kubernetes"
        "$vcsh"
        "$fossil_branch"
        "$hg_branch"
        "$pijul_channel"
        "$docker_context"
        "$package"
        "$c"
        "$cpp"
        "$cmake"
        "$cobol"
        "$daml"
        "$dart"
        "$deno"
        "$dotnet"
        "$elixir"
        "$elm"
        "$erlang"
        "$fennel"
        "$fortran"
        "$golang"
        "$guix_shell"
        "$haskell"
        "$haxe"
        "$helm"
        "$java"
        "$julia"
        "$kotlin"
        "$gradle"
        "$lua"
        "$nim"
        "$nodejs"
        "$ocaml"
        "$opa"
        "$perl"
        "$php"
        "$pulumi"
        "$purescript"
        "$python"
        "$raku"
        "$rlang"
        "$red"
        "$ruby"
        "$rust"
        "$scala"
        "$solidity"
        "$swift"
        "$terraform"
        "$vlang"
        "$vagrant"
        "$xmake"
        "$zig"
        "$buf"
        "$conda"
        "$pixi"
        "$meson"
        "$spack"
        "$memory_usage"
        "$aws"
        "$gcloud"
        "$openstack"
        "$azure"
        "$crystal"
        "$custom"
        "$status"
        "$battery"
      ];

      # OS Icon
      os = {
        disabled = false;
        format = "[ $symbol]($style)";
        style = "bg:#A3AED2 fg:#090C0C";

        symbols = {
          # https://www.nerdfonts.com/cheat-sheet
          AlmaLinux = "";
          CentOS = "";
          Debian = "";
          Fedora = "";
          FreeBSD = "";
          Gentoo = "";
          Kali = "";
          Linux = "";
          Macos = "";
          NixOS = "";
          Raspbian = "";
          Redhat = "";
          RockyLinux = "";
          Ubuntu = "";
          Windows = "";
        };
      };

      # Directory
      directory = {
        format = "[ $path]($style)[$read_only]($read_only_style)";
        read_only = " 󰌾";
        repo_root_format = "[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style)";
        repo_root_style = "bg:#769FF0 bold bright-yellow";
        style = "bg:#769FF0 fg:#E3E5E5";
        truncation_length = 4;
        truncation_symbol = "…/";
        truncate_to_repo = false;
      };

      # Git
      git_branch = {
        format = "[[ $symbol $branch(:$remote_branch) ](fg:#769FF0 bg:#394260)]($style)";
        ignore_branches = [
          "main"
          "master"
        ];
        style = "bg:#394260";
        symbol = "";
        truncation_length = 42;
        truncation_symbol = "⋯";
      };

      git_metrics = {
        added_style = "bg:#394260 bold bright-green";
        deleted_style = "bg:#394260 bold bright-red";
        disabled = false;
        format = "([+$added]($added_style))([ -$deleted ]($deleted_style))";
      };

      git_state = {
        format = "\([$state( $progress_current/$progress_total)](fg:#769FF0 bg:#394260)\)";
        style = "bg:#394260";
      };

      git_status = {
        ahead = "\${count}";
        behind = "\${count}";
        conflicted = "󱐋";
        deleted = "✘";
        diverged = "\${ahead_count}\${behind_count}";
        format = "[[($all_status$ahead_behind )](fg:#769FF0 bg:#394260)]($style)";
        modified = "";
        renamed = "󰄾";
        staged = "";
        stashed = "";
        style = "bg:#394260";
        untracked = "";
      };

      # Right Panel: Languages & Tools
      aws = {
        format = "[[ $symbol ($profile)(\[$duration\]) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      bun = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      c = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      cpp = {
        disabled = false;
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      deno = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      docker_context = {
        format = "[[ $symbol $context ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      golang = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "󰟓";
      };

      gradle = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      java = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      kotlin = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      lua = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "󰢱";
      };

      mojo = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      nodejs = {
        detect_extensions = [ ];
        detect_files = [
          "package-lock.json"
          "yarn.lock"
        ];
        detect_folders = [ "node_modules" ];
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "󰎙";
      };

      package = {
        format = "[[ $symbol ($version) ](italic dimmed fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "󰏖";
      };

      php = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "󰌟";
      };

      pixi = {
        format = "[[ $symbol ($version) (\($environment\)) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "󱝂";
      };

      python = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      rust = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      swift = {
        format = "[[ $symbol ($version) ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      terraform = {
        format = "[[ $symbol $workspace ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      vagrant = {
        format = "[[ $symbol $workspace ](fg:#769FF0 bg:#212736)]($style)";
        style = "bg:#212736";
        symbol = "";
      };

      # Prompt extras
      battery = {
        charging_symbol = "[󰂄](italic bold green)";
        discharging_symbol = "󰂌";
        empty_symbol = "";
        format = "[ $percentage $symbol]($style)";
        full_symbol = "";
        unknown_symbol = "󰂑";

        display = [
          {
            style = "italic bold red";
            threshold = 20;
          }
          {
            style = "italic dimmed bright-purple";
            threshold = 60;
          }
          {
            style = "italic dimmed yellow";
            threshold = 70;
          }
        ];
      };

      cmd_duration = {
        format = "[ 󱎫 $duration ](italic dimmed white bg:#212736)";
        min_time = 2000;
        style = "bg:#212736";
      };

      container = {
        format = "[$symbol $name]($style) ";
        style = "bold dimmed green";
        symbol = "⬢";
      };

      hostname = {
        format = "[@$hostname]($style)";
        ssh_only = true;
        style = "bold dimmed white";
      };

      jobs = {
        format = "[$symbol$number]($style) ";
        style = "white";
        symbol = "[▶](blue italic)";
      };

      localip = {
        disabled = false;
        format = "[ $localipv4 ](bold magenta)";
        ssh_only = true;
      };

      memory_usage = {
        disabled = false;
        format = "[ 󰍛 \${ram_pct}]($style)";
        style = "italic dimmed white";
        threshold = 75;
      };

      nix_shell = {
        format = "[$symbol$name]($style) ";
        style = "bold italic dimmed blue";
        symbol = " ";
      };

      shell = {
        bash_indicator = "󱆃";
        disabled = false;
        format = "[$indicator]($style) ";
        nu_indicator = "nu";
        style = "bold italic dimmed white";
        zsh_indicator = "zsh";
      };

      shlvl = {
        disabled = false;
        format = "[$symbol$shlvl]($style) ";
        style = "bold dimmed white";
        symbol = "";
        threshold = 2;
      };

      sudo = {
        disabled = false;
        format = "[󰌾 sudo]($style) ";
        style = "bold red";
      };

      time = {
        disabled = false;
        format = "[[  $time ](fg:#A0A9CB bg:#1D2230)]($style)";
        style = "bg:#1D2230";
        time_format = "%R";
      };

      username = {
        format = "[$user]($style)";
        show_always = false;
        style_root = "bold red";
        style_user = "bold dimmed white";
      };
    };
  };
}
