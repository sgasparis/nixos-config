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
    dbeaver-bin
    zed-editor
    remmina
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

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  
    initExtra = ''
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
    '';

    shellAliases = {
      ll = "ls -la";
      k = "kubectl";
      tf = "terraform";
      cat = "bat";
      ls = "eza --icons";
      tree = "eza --tree --icons";
      cd = "z";
      cdi = "zi";
      mount-proxmox = "sshfs root@192.168.x.x:/ ~/mounts/proxmox";
      unmount-proxmox = "fusermount -u ~/mounts/proxmox";
      docker = "podman";
    };

    history = {
      size = 10000;
      save = 10000;
      share = true;
      ignoreDups = true;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # Config Files
  xdg.configFile."niri/config.kdl".source = ./config/niri.kdl;
  xdg.configFile."quickshell/noctalia/settings.json".source = ./config/noctalia/settings.json;
  xdg.configFile."starship.toml".source = ./config/starship/starship.toml;
  xdg.configFile."kitty/kitty.conf".source = ./config/kitty/kitty.conf;
}
