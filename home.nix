{ pkgs, config, lib, ... }: {
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

  programs.niri = {
    enable = true;
    settings = {
      outputs."*".scale = 1.0;

      binds = {
        "Super+T".action.spawn = "alacritty";
        "Super+R".action.spawn = ["wofi" "--show" "run"];
        "Super+Q".action.close-window = {};
        "Super+Shift+E".action.quit = {};
        "Super+F".action.fullscreen-window = {};
        "Super+Left".action.focus-column-left = {};
        "Super+Right".action.focus-column-right = {};
        "Super+Up".action.focus-workspace-up = {};
        "Super+Down".action.focus-workspace-down = {};
        "Super+Shift+Left".action.move-column-left = {};
        "Super+Shift+Right".action.move-column-right = {};
      };
    };
  };
}
