{ config, pkgs, pkgsUnstable, libs, ... }:
{
  # ZSH
  programs.zsh = {
    enable = true;

    initExtra = ''
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

        ## include config generated via "p10k configure" manually; 'p10k configure' can't write to zshrc itself
       [[ ! -f ~/dotfiles/hosts/modules/p10k-config/.p10k.zsh ]] || source ~/dotfiles/hosts/modules/p10k-config/.p10k.zsh    

       source $ZSH/oh-my-zsh.sh
     '';

    initExtraBeforeCompInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };
}
