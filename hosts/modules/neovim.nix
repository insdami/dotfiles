{ config, lib, pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      gruvbox
      nerdtree
      vim-nix
      vim-markdown
      markdown-preview-nvim

    ];
    extraConfig = (builtins.concatStringsSep "\n" [
      (builtins.readFile ./vim/config.vim)
    ]);
  };
}
