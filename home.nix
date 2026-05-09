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
}
