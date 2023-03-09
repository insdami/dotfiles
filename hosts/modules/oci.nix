{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pkgs.oci-cli
  ];
}

