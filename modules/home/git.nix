{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    lfs = {
      enable = true;
      skipSmudge = true;
    };

    # TODO: fill in git userName and userEmail
    userName = "git_userName";
    userEmail = "git_userEmail";

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
      core.editor = "hx";
      color.ui = "true";
    };

    delta.enable = true;
    # diff-so-fancy.enable = true;
    # difftastic.enable = true;
  };

  programs.lazygit = {
    enable = true;
  };

  programs.git-cliff = {
    enable = true;
  };

  # home.sessionVariables.GITHUB_TOKEN = ""; # TODO : gh auth
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };

  programs.gh-dash = {
    enable = true;
    settings = {
      prSections = [
        {
          title = "My Pull Requests";
          filters = "is:open author:@me";
        }
      ];
    };
  };
}
