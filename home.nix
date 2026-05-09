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
      user.name = "your name";
      user.email = "your email";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  programs.noctalia-shell = {
    enable = true;
    settings = {
      colorSchemes = {
        darkMode = true;
        predefinedScheme = "Catppuccin";
      };
      bar = {
        position = "top";
        widgets.left = [{ type = "ActiveWindow"; }];
        widgets.center = [{ type = "Workspace"; }];
        widgets.right = [
          { type = "Volume"; }
          { type = "Battery"; }
          { type = "Clock"; }
        ];
      };
    };
  };

  xdg.configFile."niri/config.kdl".source = ./config/niri.kdl;
}
