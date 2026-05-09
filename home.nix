{ pkgs, lib, ... }: {
  home.username = "unknown";
  home.homeDirectory = "/home/unknown";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    htop
    ripgrep
    alacritty
    waybar
    wofi
    swaylock
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "your name";
      user.email = "your email";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  xdg.configFile."niri/config.kdl".source = ./config/niri.kdl;
}
