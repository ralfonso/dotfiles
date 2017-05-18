call plug#begin('~/.vim/plugged')

Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/scrooloose/syntastic.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
" Plug 'https://github.com/bling/vim-airline'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/fatih/vim-go.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/ivanov/vim-ipython.git'
Plug 'https://github.com/mileszs/ack.vim.git'
Plug 'https://github.com/qpkorr/vim-bufkill.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'https://github.com/ajh17/VimCompletesMe'
Plug 'https://github.com/paranoida/vim-airlineish.git'
Plug 'chriskempson/base16-vim'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/dcharbon/vim-flatbuffers'
Plug 'arcticicestudio/nord-vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'zchee/deoplete-go', { 'do': 'make'}
endif

call plug#end()
