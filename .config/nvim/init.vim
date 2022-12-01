" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
" https://vim.fandom.com/wiki/Example_vimrc

set nocompatible

set nobackup

filetype on
filetype plugin on
filetype indent on

syntax on

set nowrap

set number

set hlsearch
set ignorecase
set smartcase

set shiftwidth=4
set tabstop=4
set noexpandtab
set autoindent

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
	Plug 'preservim/nerdtree' " https://github.com/preservim/nerdtree
	Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
	Plug 'vim-airline/vim-airline-themes' " https://github.com/vim-airline/vim-airline-themes
	Plug 'arcticicestudio/nord-vim' " https://github.com/arcticicestudio/nord-vim
	Plug 'ryanoasis/vim-devicons' " https://github.com/ryanoasis/vim-devicons
	Plug 'neoclide/coc.nvim' " https://github.com/neoclide/coc.nvim
call plug#end()

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
  \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

colorscheme nord

" Install missing coc.nvim extensions
let g:coc_global_extensions = []
