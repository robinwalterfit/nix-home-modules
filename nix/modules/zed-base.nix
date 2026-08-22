# SPDX-FileCopyrightText: 2026 Robin Walter <hello@robinwalter.me>
# SPDX-License-Identifier: MIT
#
{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;

    # Zed Extensions that shall be installed automatically
    extensions = [
      "biome"
      "codeowners"
      "git-firefly"
      "html"
      "just"
      "log"
      "material-icon-theme"
      "mermaid"
      "nix"
      "nu"
      "one-dark-pro"
      "toml"
    ];

    # Additional packages that shall be available to Zed
    extraPackages = with pkgs; [
      basedpyright
      bash-language-server
      biome
      just
      just-lsp
      nil
      nixd
      nixfmt
      nodejs
      package-version-server
      python314
      python3Packages.python-lsp-server
      python3Packages.python-lsp-ruff
      ruff
      rust-analyzer
      ty
      uv
      vtsls
      yaml-language-server
    ];

    # Default user configuration
    userSettings = {
      agent = {
        button = true;
        default_height = 320;
        default_profile = "ask";
        default_width = 640;
        dock = "right";
        enabled = true;
        play_sound_when_agent_done = "when_hidden";
        single_file_review = true;
        use_modifier_to_send = true;
      };
      always_treat_brackets_as_autoclosed = true;
      audio = {
        "experimental.auto_microphone_volume" = true;
      };
      auto_install_extensions = { };
      auto_update = false;
      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };
      autoscroll_on_clicks = false;
      base_keymap = "VSCode";
      buffer_font_fallbacks = [
        "Fira Code"
        ".ZedMono"
        "Menlo"
        "Monaco"
        "Courier New"
      ];
      buffer_font_family = "FiraCode Nerd Font";
      buffer_font_features = {
        calt = true;
      };
      buffer_font_size = 14;
      buffer_font_weight = 450;
      buffer_line_height = "comfortable";
      calls = {
        mute_on_join = true;
        share_on_join = false;
      };
      centered_layout = {
        left_padding = 0.2;
        right_padding = 0.2;
      };
      code_lens = "on";
      collaboration_panel = {
        dock = "left";
      };
      confirm_quit = false;
      current_line_highlight = "all";
      cursor_blink = true;
      cursor_shape = "bar";
      diagnostics = {
        inline = {
          enabled = true;
        };
      };
      edit_predictions = {
        disabled_globs = [
          "**/.env*"
          "**/*.pem"
          "**/*.key"
          "**/*.cert"
          "**/*.crt"
          "**/secrets.yml"
        ];
      };
      edit_predictions_disabled_in = [
        "comment"
        "string"
      ];
      enable_language_server = true;
      ensure_final_newline_on_save = true;
      file_finder = {
        modal_max_width = "small";
      };
      file_scan_exclusions = [
        "**/.cache"
        "**/.git"
        "**/.hg"
        "**/.jj"
        "**/.pytest_cache"
        "**/.ruff_cache"
        "**/.svn"
        "**/__pycache__"
        "**/CVS"
        "**/.DS_Store"
        "**/Thumbs.db"
        "**/.classpath"
        "**/.settings"
      ];
      file_types = {
        Dockerfile = [ "*Dockerfile*" ];
        Mardown = [ "mdoc" ];
      };
      format_on_save = "off";
      formatter = "auto";
      git = {
        git_gutter = "tracked_files";
        inline_blame = {
          delay_ms = 500;
          enabled = true;
          min_column = 100;
          show_commit_summary = true;
        };
      };
      git_panel = {
        dock = "left";
      };
      hard_tabs = false;
      hover_popover_enabled = true;
      icon_theme = "Material Icon Theme";
      indent_guides = {
        background_coloring = "disabled";
        coloring = "indent_aware";
        enabled = true;
        line_width = 1;
      };
      inlay_hints = {
        edit_debounce_ms = 700;
        enabled = true;
        show_background = false;
        show_other_hints = true;
        show_parameter_hints = true;
        show_type_hints = true;
        scroll_debounce_ms = 50;
      };
      journal = {
        hour_format = "hour24";
        path = "~";
      };
      languages = {
        Go = {
          colorize_brackets = true;
          inlay_hints = {
            enabled = true;
          };
        };
        JavaScript = {
          always_treat_brackets_as_autoclosed = true;
          colorize_brackets = true;
          ensure_final_newline_on_save = true;
          format_on_save = "on";
          formatter = [
            { code_action = "source.fixAll.biome"; }
            { code_action = "source.organizeImports.biome"; }
            {
              language_server = {
                name = "biome";
              };
            }
          ];
          hard_tabs = false;
          inlay_hints = {
            enabled = true;
          };
          language_servers = [
            "biome"
            "!vtsls"
            "..."
          ];
          preferred_line_length = 120;
          remove_trailing_whitespace_on_save = true;
          show_whitespaces = "selection";
          soft_wrap = "editor_width";
          tab_size = 2;
          use_autoclose = true;
          wrap_guides = [ 120 ];
        };
        JSON = {
          colorize_brackets = true;
          format_on_save = "on";
          formatter = [
            { code_action = "source.fixAll.biome"; }
            {
              language_server = {
                name = "biome";
              };
            }
          ];
          language_servers = [
            "biome"
            "..."
          ];
          preferred_line_length = 120;
          remove_trailing_whitespace_on_save = true;
          show_whitespaces = "selection";
          soft_wrap = "editor_width";
          tab_size = 2;
          wrap_guides = [ 120 ];
        };
        JSONC = {
          colorize_brackets = true;
          format_on_save = "on";
          formatter = [
            { code_action = "source.fixAll.biome"; }
            {
              language_server = {
                name = "biome";
              };
            }
          ];
          language_servers = [
            "biome"
            "..."
          ];
          preferred_line_length = 120;
          remove_trailing_whitespace_on_save = true;
          show_whitespaces = "selection";
          soft_wrap = "editor_width";
          tab_size = 2;
          wrap_guides = [ 120 ];
        };
        Markdown = {
          format_on_save = "on";
          remove_trailing_whitespace_on_save = false;
        };
        Python = {
          colorize_brackets = true;
          edit_predictions_disabled_in = [ "comment" ];
          format_on_save = "on";
          formatter = [
            { code_action = "source.fixAll.ruff"; }
            { code_action = "source.organizeImports.ruff"; }
            {
              language_server = {
                name = "ruff";
              };
            }
          ];
          language_servers = [
            "basedpyright"
            "ruff"
            "..."
          ];
          wrap_guides = [ 100 ];
        };
        Rust = {
          colorize_brackets = true;
          format_on_save = "on";
          formatter = "language_server";
          inlay_hints = {
            enabled = true;
          };
          wrap_guides = [
            100
            120
          ];
        };
        "Shell Script" = {
          colorize_brackets = true;
          hard_tabs = true;
        };
        TOML = {
          ensure_final_newline_on_save = false;
        };
        TypeScript = {
          always_treat_brackets_as_autoclosed = true;
          colorize_brackets = true;
          ensure_final_newline_on_save = true;
          format_on_save = "on";
          formatter = [
            { code_action = "source.fixAll.biome"; }
            { code_action = "source.organizeImports.biome"; }
            {
              language_server = {
                name = "biome";
              };
            }
          ];
          hard_tabs = false;
          inlay_hints = {
            enabled = true;
          };
          language_servers = [
            "biome"
            "!vtsls"
            "..."
          ];
          preferred_line_length = 120;
          remove_trailing_whitespace_on_save = true;
          show_whitespaces = "selection";
          soft_wrap = "editor_width";
          tab_size = 2;
          use_autoclose = true;
          wrap_guides = [ 120 ];
        };
        TSX = {
          always_treat_brackets_as_autoclosed = true;
          colorize_brackets = true;
          ensure_final_newline_on_save = true;
          format_on_save = "on";
          formatter = [
            { code_action = "source.fixAll.biome"; }
            { code_action = "source.organizeImports.biome"; }
            {
              language_server = {
                name = "biome";
              };
            }
          ];
          hard_tabs = false;
          inlay_hints = {
            enabled = true;
          };
          language_servers = [
            "biome"
            "!vtsls"
            "..."
          ];
          preferred_line_length = 120;
          remove_trailing_whitespace_on_save = true;
          show_whitespaces = "selection";
          soft_wrap = "editor_width";
          tab_size = 2;
          use_autoclose = true;
          wrap_guides = [ 120 ];
        };
        YAML = {
          colorize_brackets = true;
          formatter = "language_server";
        };
      };
      load_direnv = "direct";
      lsp = {
        basedpyright = {
          settings = {
            analysis = {
              diagnosticMode = "workspace";
              typeCheckingMode = "strict";
            };
          };
        };
        biome = {
          settings = {
            require_config_file = true;
          };
        };
        gopls = {
          initialization_options = {
            hints = {
              assignVariableTypes = true;
              compositeLiteralFields = true;
              compositeLiteralTypes = true;
              constantValues = true;
              functionTypeParameters = true;
              parameterNames = true;
              rangeVariableTypes = true;
            };
          };
        };
        rust-analyzer = {
          initialization_options = {
            check = {
              command = "clippy";
            };
            completion = {
              snippets = {
                custom = {
                  "Arc::new" = {
                    body = [ "Arc::new(\${receiver})" ];
                    postfix = "arc";
                    requires = "std::sync::Arc";
                    scope = "expr";
                  };
                  "Box::pin" = {
                    body = [ "Box::pin(\${receiver})" ];
                    postfix = "boxpin";
                    requires = "std::boxed::Box";
                    scope = "expr";
                  };
                  Ok = {
                    body = [ "Ok(\${receiver})" ];
                    postfix = "ok";
                    scope = "expr";
                  };
                  "Rc::new" = {
                    body = [ "Rc::new(\${receiver})" ];
                    postfix = "rc";
                    requires = "std::rc::Rc";
                    scope = "expr";
                  };
                  Some = {
                    body = [ "Some(\${receiver})" ];
                    postfix = "some";
                    scope = "expr";
                  };
                  "vec!" = {
                    body = [ "vec![\${receiver}]" ];
                    description = "vec![]";
                    postfix = "vec";
                    scope = "expr";
                  };
                };
              };
            };
            diagnostics = {
              experimental = {
                enable = true;
              };
            };
            inlayHints = {
              closureReturnTypeHints = {
                enable = "always";
              };
              lifetimeElisionHints = {
                enable = "skip_trivial";
                useParameterNames = true;
              };
              maxLength = null;
            };
          };
          settings = { };
        };
        tailwindcss-language-server = {
          settings = {
            classFunctions = [
              "cva"
              "cx"
            ];
            experimental = {
              classRegex = [ "[cls|className]\\s\\:\\=\\s\"([^\"]*)" ];
            };
          };
        };
        yaml-language-server = {
          settings = {
            yaml = {
              format = {
                singleQuote = false;
              };
            };
          };
        };
      };
      lsp_highlight_debounce = 75;
      minimap = {
        show = "auto";
      };
      outline_panel = {
        auto_fold_dirs = true;
        auto_reveal_entries = true;
        button = true;
        default_width = 300.0;
        dock = "left";
        file_icons = true;
        folder_icons = true;
        git_status = true;
        indent_guides = {
          show = "always";
        };
        indent_size = 20;
        scrollbar = {
          show = null;
        };
      };
      preferred_line_length = 100;
      preview_tabs = {
        enable_preview_from_file_finder = false;
        enabled = true;
      };
      project_panel = {
        auto_fold_dirs = true;
        auto_open = {
          on_create = true;
          on_drop = false;
          on_paste = false;
        };
        auto_reveal_entries = true;
        button = true;
        default_width = 420;
        dock = "left";
        entry_spacing = "comfortable";
        file_icons = true;
        folder_icons = true;
        git_status = true;
        hide_gitignore = false;
        indent_guides = {
          show = "always";
        };
        indent_size = 20;
        scrollbar = {
          show = null;
        };
        show_diagnostics = "all";
      };
      remove_trailing_whitespace_on_save = true;
      restore_on_startup = "last_session";
      scrollbar = {
        axes = {
          horizontal = true;
          vertical = true;
        };
        cursors = true;
        diagnostics = "all";
        git_diff = true;
        search_results = true;
        selected_symbol = true;
        show = "auto";
      };
      search = {
        case_sensitive = false;
        include_ignored = true;
        regex = true;
        whole_word = false;
      };
      show_call_status_icon = true;
      show_completion_documentation = true;
      show_completions_on_input = true;
      show_edit_predictions = false;
      show_whitespaces = "selection";
      show_wrap_guides = true;
      soft_wrap = "editor_width";
      sticky_scroll = {
        enabled = true;
      };
      tab_bar = {
        show = true;
        show_nav_history_buttons = true;
        show_tab_bar_buttons = true;
      };
      tab_size = 4;
      tabs = {
        activate_on_close = "history";
        close_position = "right";
        file_icons = true;
        git_status = true;
        show_close_button = "hover";
        show_diagnostics = "all";
      };
      terminal = {
        alternate_scroll = "off";
        blinking = "terminal_controlled";
        button = true;
        copy_on_select = true;
        detect_venv = {
          on = {
            activate_script = "default";
            directories = [
              ".venv"
              "venv"
            ];
          };
        };
        dock = "bottom";
        env = { };
        font_family = "MesloLGS Nerd Font Mono";
        font_features = {
          calt = false;
        };
        font_size = 15;
        font_weight = 400.0;
        line_height = "comfortable";
        option_as_meta = false;
        shell = "system";
        toolbar = {
          breadcrumbs = true;
        };
        working_directory = "current_project_directory";
      };
      theme = {
        dark = "One Dark Pro";
        light = "One Light";
        mode = "dark";
      };
      title_bar = {
        show_sign_in = false;
      };
      toolbar = {
        breadcrumbs = true;
        code_actions = true;
        quick_actions = true;
      };
      ui_font_fallbacks = [
        "Fira Code"
        "FiraCode Nerd Font"
        "MesloLGS Nerd Font"
      ];
      ui_font_family = ".ZedSans";
      ui_font_features = {
        calt = false;
      };
      ui_font_size = 16;
      ui_font_weight = 450.0;
      unnecessary_code_fade = 0.3;
      use_autoclose = true;
      use_smartcase_search = true;
      use_system_window_tabs = false;
      wrap_guides = [ ];
    };
  };
}
