{ config, pkgs, pkgsUnstable, libs, ... }:
{
  home.packages = with pkgs; [
    fish
    fzf

    bottom
    
    tree
    du-dust

    wget
    jq
    zip
    pigz
    lz4
    git
    nixpkgs-fmt
  
  ] ++ lib.optionals stdenv.isLinux [
    iputils 
    libuuid 
  ];
}
