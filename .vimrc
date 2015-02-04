call pathogen#infect()
let mapleader=","
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

colorscheme solarized
let g:solarized_contrast = "high"

if has('gui_running')
    set mouse=a

    "set guifont=Mensch:h12
    set guifont=Menlo\ for\ Powerline:h12
	set guioptions-=T
	set guioptions+=g
	set guioptions+=i
	set guioptions+=t
	set guioptions-=L
	set guioptions-=l
	set guioptions+=r
	set guioptions-=e
	set guioptions+=p

    nnoremap <D-t> :enew!<CR>
    nnoremap <D-t> <ESC>:enew!<CR>
    nnoremap <D-w> :bdelete<CR>
    nnoremap <D-w> <ESC>:bdelete<CR>

	" Control-Shift-PageDown drags the active tab page to the right (wraps
	" around
	imap <silent> <C-S-PageDown> <C-o>:call <Sid>DragRight()<Cr>
	nmap <silent> <C-S-PageDown> :call <Sid>DragRight()<Cr>

endif

set number
set cursorline
set laststatus=2
set showtabline=2

" for airline
let g:airline_enable_syntastic=1
let g:airline_theme='r2kolor'
let g:airline_powerline_fonts=1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamemod = ':.'

" syntastic
let g:syntastic_java_checkers=[]
let g:syntastic_always_populate_loc_list = 1

" encoding
set termencoding=utf-8
set encoding=utf-8

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
set showmatch
set showmode
set title
set titlestring=VIM:\ %<%F
set ttyfast
set undolevels=2000
set viminfo='1000,f1,:1000,/1000
set wildmenu

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" indent settings
set ai
set backspace=2
set shiftwidth=4
set tabstop=4

" folding
set foldmethod=marker

" search options
set nocursorline
""set isk=@,48-57,_,192-255,-,.,@-@
set nohlsearch
set ignorecase

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
    autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 omnifunc=phpcomplete#CompletePHP
    autocmd FileType xml setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType puppet setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType markdown setlocal textwidth=79
    autocmd FileType coffeescript setlocal expandtab shiftwidth=2 tabstop=2
        \ formatoptions+=croq softtabstop=2 smartindent
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
        \ list listchars=tab:>.,trail:.,extends:#,nbsp:.
    autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4
augroup END

let g:py_select_leading_comments = 0

" Make <space> in normal mode go down a page rather than left a character
"noremap <space> <C-f>

map <F9> :set number!<CR>
map <C-W>; :bprev!<CR>
map <C-W>' :bnext!<CR>
:nmap <C-t> :enew!<CR>
:imap <C-t> <ESC>:enew!<CR>
map <Leader>T :enew!<CR>

" enable syntax hilighting "
syntax on
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

map <Leader>v :e ~/.vimrc<CR>
map <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" vbell on osx, which doesn't work anyway
set vb

runtime macros/matchit.vim

" load project-based tags
set tags=~/.vim/mytags/$PROJ

let vimfiles=$HOME . "/.vim"

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

"inoremap <tab> <c-r>=Smart_TabComplete()<CR>

"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" Copy current buffer path relative to root of VIM session to system clipboard
nnoremap <Leader>yp :let @*=expand("%")<cr>:echo "Copied file path to clipboard"<cr>

" make tagbar a bit wider
let g:tagbar_width = 60

" some golang settings
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_fmt_command = "goimports"

" ctrlp settings
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_max_files=20000

" NERDTree
map <C-n> :NERDTreeToggle<cr>
