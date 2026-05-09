{ pkgs, ... }: {
  home.username = "unknown";
  home.homeDirectory = "/home/unknown";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    htop
    ripgrep
  ];

  programs.git = {
    enable = true;
    userName = "sgasparis";
    userEmail = "gasparis.steven@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  programs.niri = {
    enable = true;
    settings = {
      outputs."*".scale = 1.0;
    
      binds = with config.lib.niri.actions; {
        "Super+T".action = spawn "alacritty";
        "Super+R".action = spawn "wofi" "--show" "run";
        "Super+Q".action = close-window;
        "Super+Shift+E".action = quit;
        "Super+F".action = fullscreen-window;
        "Super+Left".action = focus-column-left;
        "Super+Right".action = focus-column-right;
        "Super+Up".action = focus-workspace-up;
        "Super+Down".action = focus-workspace-down;
        "Super+Shift+Left".action = move-column-left;
        "Super+Shift+Right".action = move-column-right;
      };
    };
  };
}
