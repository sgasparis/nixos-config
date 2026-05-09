{ pkgs, inputs, ... }: {
  home.username = "unknown";
  home.homeDirectory = "/home/unknown";
  home.stateVersion = "25.11";

  imports = [ inputs.noctalia.homeModules.default ];

  home.packages = with pkgs; [
    htop
    ripgrep
    alacritty
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "sgapsaris";
      user.email = "gasparis.steven@proton.me";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  programs.noctalia-shell = {
    enable = true;
  };

  xdg.configFile."niri/config.kdl".source = ./config/niri.kdl;
  xdg.configFile."quickshell/noctalia/settings.json".source = ./config/noctalia/settings.json;
}
