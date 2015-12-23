source ~/.vim/plugins.vim
let mapleader=","

" try space for leader too
:nmap <space> ,

set bg=dark
set wildignore+=*.o,*obj,.git,*.pyc,**/static/assets/**,*.class,env,target/**,**/node_modules/**,node_modules,**/target/*,**/bower_components/**

" this helps to throw onchange events for file watchers like Watchdog
set noswapfile
set mouse=

set hidden

" you can do this
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd InsertLeave * redraw!

set background=dark
"colorscheme solarized
let base16colorspace=256
colorscheme base16-monokai
let g:solarized_contrast = "high"

" for airline
let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme='r2ish'
let g:airline_powerline_fonts=1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline_solarized_bg='dark'

" syntastic
let g:syntastic_java_checkers=[]
let g:syntastic_always_populate_loc_list = 1
" aint no one linting ruby
let g:syntastic_ruby_checkers=[]
let g:syntastic_enable_ruby_checker = 0

set number
set cursorline
set laststatus=2
set showtabline=2

" encoding
if has("vim_starting")
    set termencoding=utf-8
    set encoding=utf-8
endif

set nolist

" basic options
set cmdheight=1
set history=1000
set modeline
set nocompatible
set noerrorbells
set novisualbell
set shortmess+=aIt
set showcmd
set showfulltag
set noshowmatch
set showmode
set title
set titlestring=VIM:\ %<%F
set ttyfast
set undolevels=2000
set viminfo='1000,f1,:1000,/1000
set wildmenu

set nobackup
"set backupdir=~/.vim-backup,~/.tmp,~/tmp,/var/tmp,/tmp
"set backupskip=/tmp/*,/private/tmp/*
"set directory=~/.vim-backup,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" indent settings
set ai
set backspace=2
set shiftwidth=4
set tabstop=4

" folding
set foldmethod=indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" search options
""set isk=@,48-57,_,192-255,-,.,@-@
set nohlsearch
set ignorecase
set noincsearch

" set a toggle for pasting input
set pastetoggle=<F10>

" set bracket matching and comment formats
set matchpairs+=<:>
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*
set comments+=b:\"
set comments+=n::

" use less space for line numbering if possible
if v:version >= 700
	try
	setlocal numberwidth=3
		catch
	endtry
endif

" use css for generated html files
let html_use_css=1

" allow project specific vimrc
set exrc
set secure

" setup a sweet statusline
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%t\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&fileencoding},            " fileencoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=0x%-8B\                      " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" enable filetype detection
filetype on
filetype plugin on
set ofu=syntaxcomplete#Complete
""filetype indent on

set expandtab
set shiftwidth=4
set tabstop=4

if exists("vimrcEX")
    autocmd! vimrcEX
endif

augroup vimrcEX
    au BufRead,BufNewFile *.md set filetype=markdown
    au BufRead,BufNewFile *.pp   setfiletype puppet
    autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType scss setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType htmldjango setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType phtml setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
    autocmd FileType clojure setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType perl setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 omnifunc=phpcomplete#CompletePHP
    autocmd FileType xml setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType make setlocal noexpandtab
    autocmd FileType puppet setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType markdown setlocal textwidth=79
    autocmd FileType coffeescript setlocal expandtab shiftwidth=2 tabstop=2
        \ formatoptions+=croq softtabstop=2 smartindent
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
        \ list listchars=tab:>.,trail:.,extends:#,nbsp:.
    autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4
    autocmd FileType proto setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType sh setlocal expandtab shiftwidth=2 tabstop=2
augroup END

let g:py_select_leading_comments = 0

" Make <space> in normal mode go down a page rather than left a character
"noremap <space> <C-f>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>' :bnext<CR>

" Move to the previous buffer
nmap <leader>; :bprevious<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" tabs
 noremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" enable syntax hilighting "
syntax on

map <Leader>v :e ~/.vimrc<CR>
map <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" vbell on osx, which doesn't work anyway
set vb

nmap <leader>t :TagbarToggle<cr>
let g:tagbar_width = 60

" some golang settings
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_fmt_command = "goimports"

" NERDTree
map <C-n> :NERDTreeToggle<cr>

" FZF
nnoremap <silent> <Leader><Leader> :FZF -m<CR>

" FZF Buffers
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Space> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" gitgutter
set updatetime=250

" fix the YouCompleteMe scratch window
let g:ycm_autoclose_preview_window_after_completion = 1

" regenerate gotags on save. this really only works well for users of fugitive
" and/or vim-git since it sets b:git_dir
function! Tags_to_git_dir()
    if exists('b:git_dir')
        execute "silent! !cd " . b:git_dir . " && gotags -R .. > " . b:git_dir . "/tags &"
    endif
endfunction
au BufWritePost *.go :call Tags_to_git_dir()
