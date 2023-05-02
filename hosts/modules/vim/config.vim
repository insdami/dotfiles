syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" colorscheme solarized
colorscheme gruvbox

set background=dark
set number " enable line numbers
set smartindent
set shell=/bin/bash
set tabstop=2
set shiftwidth=2
set expandtab
set visualbell
set noerrorbells
set laststatus=2
set backspace+=start,eol,indent
set cursorline
set autochdir
set wildmenu

set nowritebackup " prevent vim from creating ultra shortliving tmp files

scriptencoding utf-8
set encoding=utf-8

" never fold
set nofoldenable
au BufRead * normal zR

" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

" undo history
set hidden " persist undo history
set undofile
set undodir=$HOME/.vimundo

set backupdir=~/.vim/backups
set directory=~/.vim/swaps

let mapleader = "\<Space>"
set clipboard=unnamed
set visualbell
set noerrorbells
set mouse=a

" Remember last cursor position
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set spelllang=en
set spellfile=$HOME/dotfiles/hosts/modules/vim/en.utf-8.add

