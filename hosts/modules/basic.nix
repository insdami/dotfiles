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
  
  programs.sioyek.enable = true;

}

