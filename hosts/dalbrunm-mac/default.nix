{ config, pkgs, ... }:
{
  nix.useDaemon = true;
  
  system.defaults.dock.autohide = true;
  environment.variables.GIT_AUTHOR_EMAIL = "damian.albrun.mira@oracle.com";
  environment.variables.GIT_AUTHOR_NAME = "Damian Albrun Mira";

  environment.systemPackages =
    [
      config.programs.vim.package

      pkgs.ctags
      pkgs.curl
      pkgs.direnv
      pkgs.gettext
      pkgs.git
      pkgs.htop
      pkgs.jq
      pkgs.vault
      pkgs.oci-cli

    ];
  
  programs.zsh = {
    enable = true;
    enableSyntaxHighlighting = true;
    enableBashCompletion = true;
    enableFzfCompletion = true;
    enableFzfGit = true;
    enableFzfHistory = true;

    interactiveShellInit = ''
       export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
       export FZF_BASE=${pkgs.fzf}/share/fzf/
       # Customize your oh-my-zsh options here
       ZSH_THEME="robbyrussell"
       plugins=(git fzf )
       HISTFILESIZE=500000
       HISTSIZE=500000
       setopt SHARE_HISTORY
       setopt HIST_IGNORE_ALL_DUPS
       setopt HIST_IGNORE_DUPS
       setopt INC_APPEND_HISTORY
       autoload -U compinit && compinit
       unsetopt menu_complete
       setopt completealiases
    
       if [ -f ~/.aliases ]; then
         source ~/.aliases
       fi
    
       source $ZSH/oh-my-zsh.sh
     '';

    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };

  programs.vim.package = pkgs.neovim.override {
    configure = {
      packages.darwin.start = with pkgs.vimPlugins; [
        vim-sensible
        vim-surround
        ReplaceWithRegister
        polyglot
        fzfWrapper
        ale
        deoplete-nvim
      ];

      customRC = ''
        set completeopt=menuone
        set encoding=utf-8
        set hlsearch
        set list
        set number
        set showcmd
        set splitright
        cnoremap %% <C-r>=expand('%:h') . '/'<CR>
        nnoremap // :nohlsearch<CR>
        let mapleader = ' '
        " fzf
        nnoremap <Leader>p :FZF<CR>
        " vim-surround
        vmap s S
        " ale
        nnoremap <Leader>d :ALEGoToDefinition<CR>
        nnoremap <Leader>D :ALEGoToDefinitionInVSplit<CR>
        nnoremap <Leader>k :ALESignature<CR>
        nnoremap <Leader>K :ALEHover<CR>
        nnoremap [a :ALEPreviousWrap<CR>
        nnoremap ]a :ALENextWrap<CR>
        " deoplete
        inoremap <expr><C-g> deoplete#undo_completion()
        inoremap <expr><C-l> deoplete#refresh()
        inoremap <silent><expr><C-Tab> deoplete#mappings#manual_complete()
        inoremap <silent><expr><Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
        let g:deoplete#enable_at_startup = 1
      '';
    };
  };


}
