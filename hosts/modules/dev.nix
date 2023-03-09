{ config, pkgs, lib, libs, ... }:
{
  programs.k9s = {
    enable = true;
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.shellAliases = {
    colima-start = "colima start --arch x86_64 --memory 8 --kubernetes";
  };


  home.packages = with pkgs; [
    kubectl
    kubectx
    kcat
    colima

    lazydocker
  ];

}
