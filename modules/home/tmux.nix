{ ... }:
{
  programs.tmux = {
    enable = true;
    # keyMode = "vi";
    mouse = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    # enableFishIntegration = true;
    tmux = {
      enableShellIntegration = true;
      # shellIntegrationOptions = {};
    };
  };
}
