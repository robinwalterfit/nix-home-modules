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
    mkIf
    mkMerge
    mkOption
    types
    ;

  cfg = config.robinwalterfit.nix-home-modules.fastfetch;

  fastfetchCmd = "${lib.getExe pkgs.fastfetch}";
in
{
  options.robinwalterfit.nix-home-modules.fastfetch = {
    modulesHead = mkOption {
      default = [ ];
      description = literalMD "Modules, which should be shown first";
      example = literalExpression ''
        [
          { type = "users"; }
          { type = "locale"; }
          { type = "datetime"; }
          { type = "bios"; }
          { type = "bootmgr"; }
          { type = "board"; }
          { type = "chassis"; }
          { type = "loadavg"; }
          { type = "processes"; }
          { type = "display"; }
          { type = "brightness"; }
          { type = "monitor"; }
          { type = "lm"; }
          { type = "de"; }
          { type = "wm"; }
          { type = "wmtheme"; }
          { type = "theme"; }
          { type = "icons"; }
          { type = "font"; }
          { type = "cursor"; }
          { type = "wallpaper"; }
          { type = "terminal"; }
          { type = "terminalfont"; }
          { type = "terminalsize"; }
          { type = "terminaltheme"; }
        ]
      '';
      type = types.listOf types.attrs;
    };

    modulesBody = mkOption {
      default = [ ];
      description = literalMD "Modules, which should be shown in the middle";
      example = literalExpression ''
        [
          {
            driverSpecific = true;
            temp = true;
            type = "gpu";
          }
          { type = "vulkan"; }
          { type = "opengl"; }
          { type = "opencl"; }
          { type = "physicalmemory"; }
          { type = ""trfs; }

         {{
            temp = true;
            type = "battery";
          }
          { type = "poweradapter"; }
          { type = "wifi"; }
          { type = "bluetooth"; }
          { type = "bluetoothradio"; }
          { type = "sound"; }
          { type = "camera"; }
          { type = "gamepad"; }
          { type = "mouse"; }
          { type = "keyboard"; }
          { type = "netio"; }
          { type = "diskio"; }
          {
            temp = true;
            type = "physicaldisk";
          }
          { type = "tpm"; } type = "zpool"; }
                   ]
      '';
      type = types.listOf types.attrs;
    };

    modulesTail = mkOption {
      default = [ ];
      description = literalMD "Modules, which should be shown at the end (before version, break and colors)";
      example = literalExpression ''
        [
          { type = "player"; }
          { type = "media"; }
          {
            timeout = 1000;
            type = "weather";
          }
        ]
      '';
      type = types.listOf types.attrs;
    };

    runOnShellInit = mkOption {
      default = true;
      description = literalMD "If `true`, add `fastfetch` command to the end of shells (bash, nushell, zsh) to show system information on shell init (only in interactive shells)";
      type = types.bool;
    };
  };

  config = mkMerge [
    {
      programs.fastfetch = {
        enable = true;

        settings = {
          logo = {
            padding = {
              top = 2;
            };
          };
          modules = [
            { type = "title"; }
            { type = "separator"; }
            { type = "os"; }
            { type = "host"; }
            { type = "kernel"; }
            { type = "initsystem"; }
            { type = "uptime"; }
            { type = "packages"; }
            { type = "shell"; }
            { type = "editor"; }
            { type = "dns"; }
            {
              timeout = 1000;
              type = "publicip";
            }
            {
              showAllIps = true;
              showFlags = true;
              showIpv6 = true;
              showLoop = true;
              showMac = true;
              showMtu = true;
              showSpeed = true;
              type = "localip";
            }
          ]
          ++ cfg.modulesHead
          ++ [
            { type = "disk"; }
            {
              separate = true;
              type = "swap";
            }
            { type = "memory"; }
            { type = "cpuusage"; }
            {
              showPeCoreCount = true;
              temp = true;
              type = "cpu";
            }
            { type = "cpucache"; }
          ]
          ++ cfg.modulesBody
          ++ cfg.modulesTail
          ++ [
            { type = "version"; }
            { type = "break"; }
            { type = "colors"; }
          ];
        };
      };
    }

    (mkIf (cfg.runOnShellInit && config.programs.bash.enable) {
      programs.bash.initExtra = ''
        # Run fastfetch only in interactive shells
        if [[ $- == *i* ]] && [[ -z "$FASTFETCH_SHOWN" ]]; then
          export FASTFETCH_SHOWN=1
          ${fastfetchCmd}
        fi
      '';
    })

    (mkIf (cfg.runOnShellInit && config.programs.nushell.enable) {
      programs.nushell.extraConfig = ''
        ${fastfetchCmd}
      '';
    })

    (mkIf (cfg.runOnShellInit && config.programs.zsh.enable) {
      robinwalterfit.nix-home-modules.zsh.initExtraLast = ''
        # Run fastfetch only in interactive shells
        if [[ $- == *i* ]] && [[ -z "$FASTFETCH_SHOWN" ]]; then
          export FASTFETCH_SHOWN=1
          ${fastfetchCmd}
        fi
      '';
    })
  ];
}
