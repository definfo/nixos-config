{ pkgs, config, ... }:
{
  # https://github.com/catppuccin/helix
  xdg.configFile."helix/themes" = {
    source = ./themes;
    recursive = true;
  };

  programs.helix = {
    enable = true;
    package = pkgs.helix;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        lsp.display-messages = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides.render = true;
      };
      keys.normal = {
        space = {
          space = "file_picker";
          w = ":w";
          q = ":q";
        };
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
      };
    };
    languages = {
      language-server.rime-ls = {
        command = "${pkgs.nur.repos.definfo.rime-ls}/bin/rime_ls";
        config.shared_data_dir = "${pkgs.nur.repos.definfo.rime-ls}/share/rime-data";
        config.user_data_dir = "${config.home.homeDirectory}/.local/share/rime-ls";
        config.log_dir = "${config.home.homeDirectory}/.local/share/rime-ls";
        config.max_candidates = 9;
        config.trigger_characters = [ ];
        config.schema_trigger_character = "&";
        config.max_tokens = 4;
        config.always_incomplete = true;
        config.long_filter_text = true;
      };
      language = [
        {
          name = "markdown";
          scope = "source.markdown";
          file-types = [
            "md"
            "markdown"
          ];
          language-servers = [ "rime-ls" ];
        }
      ];
    };
  };
}
