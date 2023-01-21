" Klaus' Vim Configuration File

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" Plugin settings
" -----------------------------------------------------------------------------
" Automatically install vim-plug plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-plug section
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim' " color theme
Plug 'vim-airline/vim-airline' " statusline
Plug 'scrooloose/nerdcommenter' " easier commenting
Plug 'scrooloose/nerdtree' " file explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plug 'tpope/vim-fugitive' " integrated Git
Plug 'airblade/vim-gitgutter' " git diff in sign column
Plug 'vim-scripts/DoxygenToolkit.vim' " rapid Doxygen commenting
Plug 'ap/vim-css-color' " view css hex colors in vim

call plug#end()

" Plugin specific Settings
" -----------------------------------------------------------------------------
" airline
let g:airline_powerline_fonts = 1

" Appearance
" -----------------------------------------------------------------------------
syntax on
set number
set colorcolumn=80

" Behavior
" -----------------------------------------------------------------------------
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set mouse=a

" User Keybindings
" -----------------------------------------------------------------------------
nnoremap <F4> :make!<cr>

" User Commands
" -----------------------------------------------------------------------------
" write to file when forgot to sudo
cmap w!! w !sudo tee > /dev/null %

" Automatic indent for other file types
filetype plugin indent on
