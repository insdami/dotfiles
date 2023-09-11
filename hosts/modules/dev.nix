{ config, pkgs, lib, libs, ... }:
{
  programs.k9s = {
    enable = true;
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.shellAliases = {
    colima-start = "colima start --arch aarch64 --memory 8";
  };


  home.packages = with pkgs; [
    # Utils
    unixtools.watch
    mkcert

    # Editor
    jetbrains.idea-community

    # K8s
    kubectl
    kubectx
    kcat
    stern # multiple container tail

    # Docker
    colima
    docker
    docker-compose
    lazydocker

    # Node
    nodejs

    grafana
    sqlite
  ];


}
