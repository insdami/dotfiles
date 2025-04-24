{ config, pkgs, pkgsUnstable, libs, ... }:
{
  
  home.sessionPath = [
    "/usr/local/bin"
  ];

  home.packages = with pkgs; [
    fzf

    bottom
    bat
    
    tree
    du-dust

    wget
    ripgrep
    jq
    zip
    pigz
    lz4
    git
    nixpkgs-fmt

    pandoc
    texlive.combined.scheme-full
  
  ] ++ lib.optionals stdenv.isLinux [
    iputils 
    libuuid 
    systemd
  ];
  
  programs.kitty = {
    enable  = true;

    settings = {
      font_size = 18;
    };

    keybindings = {
      "ctrl+alt+z" = "toggle_layout stack";
      "ctrl+alt+t" = "goto_layout tall";
      "ctrl+alt+s" = "goto_layout stack";
    };

  };

}

