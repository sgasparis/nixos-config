{ pkgs, inputs, ... }: {
  home.username = "unknown";
  home.homeDirectory = "/home/unknown";
  home.stateVersion = "25.11";

  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    htop
    ripgrep
    obsidian
    xdg-utils
    thunar
    gvfs
    thunar-volman
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "sgasparis";
      user.email = "gasparis.steven@proton.me";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  programs.noctalia-shell = {
    enable = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
  };

  xdg.configFile."niri/config.kdl".source = ./config/niri.kdl;
  xdg.configFile."quickshell/noctalia/settings.json".source = ./config/noctalia/settings.json;
  xdg.configFile."starship.toml".source = ./config/starship/starship.toml;
  xdg.configFile."kitty/kitty.conf".source = ./config/kitty/kitty.conf;
}
