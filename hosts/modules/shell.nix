{ config, pkgs, pkgsUnstable, libs, ... }:
{
  # ZSH
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    initExtra = ''
       export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
       export FZF_BASE=${pkgs.fzf}/share/fzf/
       export EDITOR=nvim

       setopt INC_APPEND_HISTORY
       unsetopt menu_complete
       setopt completealiases

       # Functionz
       fpath+=~/dotfiles/hosts/modules/zsh-functions
       autoload -Uz hms 

        ## include config generated via "p10k configure" manually; 'p10k configure' can't write to zshrc itself
       [[ ! -f ~/dotfiles/hosts/modules/p10k-config/.p10k.zsh ]] || source ~/dotfiles/hosts/modules/p10k-config/.p10k.zsh    

     '';

    initExtraBeforeCompInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';
    
    shellAliases = {
      findport = "sudo lsof -iTCP -sTCP:LISTEN -n -P | grep";
      fz = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'";
      hmd = "cd ~/dotfiles";
      v = "nvim";
      ws = "cd ~/workspace";
    };
    
    history = {
      extended = true;
      ignoreDups = true;
      share = true;
      size = 100000;
    };
     
    oh-my-zsh = {
      enable = true;
      plugins=["git" "fzf" "jump"];
    };

    plugins = with pkgs; [
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
        file = "zsh-syntax-highlighting.zsh";
      }
    ];
    
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  
  programs.dircolors.enable = true;
}
