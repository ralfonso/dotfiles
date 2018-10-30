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

" leader q uses sayonara to do a smarter close
nnoremap <silent> <leader>q :Sayonara!<CR>

" autocomplete
set completeopt=longest,menu

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd InsertLeave * redraw!

set background=dark
let base16colorspace=256
colorscheme base16-monokai
let g:solarized_contrast = "high"
set termguicolors

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
	  \   'fugitive': 'LightlineFugitive',
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

" syntastic
let g:syntastic_java_checkers=[]
let g:syntastic_always_populate_loc_list = 1
" aint no one linting ruby
let g:syntastic_ruby_checkers=[]
let g:syntastic_enable_ruby_checker = 0

" vim-go is enough
let g:syntastic_go_checkers=[]
let g:syntastic_enable_go_checker = 0

set number
set norelativenumber
set nocursorline
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
" lightline does this
set noshowmode
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
set nofoldenable
" set foldmethod=indent
" set foldnestmax=10      "deepest fold is 10 levels
" set foldlevel=1         "this is just what i use

" search options
""set isk=@,48-57,_,192-255,-,.,@-@
set nohlsearch
set ignorecase
set smartcase
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
    autocmd FileType bash setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType zsh setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType scss setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType htmldjango setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType phtml setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
    autocmd FileType clojure setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType perl setlocal noexpandtab shiftwidth=2 tabstop=2
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

    " the following stolen from jessfraz's bindings
    au FileType go nmap <Leader>s <Plug>(go-def-split)
    au FileType go nmap <Leader>v <Plug>(go-def-vertical)
    au FileType go nmap <Leader>i <Plug>(go-info)
    au FileType go nmap <Leader>l <Plug>(go-metalinter)
    au FileType go nmap <leader>r  <Plug>(go-run)
    au FileType go nmap <leader>b  <Plug>(go-build)
    au FileType go nmap <leader>t  <Plug>(go-test)
    au FileType go nmap <leader>dt  <Plug>(go-test-compile)
    au FileType go nmap <Leader>d <Plug>(go-doc)

    autocmd FileType proto setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType sh setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
augroup END

" I like these more!
augroup go
  autocmd!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
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

map <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" vbell on osx, which doesn't work anyway
set vb

nmap <leader>t :TagbarToggle<cr>
let g:tagbar_width = 60

" some golang settings
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {'goimports': '-local=do'}
let g:go_list_type = "quickfix"

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" FZF
nnoremap <silent> <Leader><Leader> :Files<cr>
nnoremap <silent> <Leader><Space> :Buffers<cr>
nnoremap <silent> <Leader>w :Windows<cr>

" gitgutter
set updatetime=250

" matchit
runtime! macros/matchit.vim

" fix the YouCompleteMe scratch window
let g:ycm_autoclose_preview_window_after_completion = 1

" fix colors in tmux
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" vim-json
let g:vim_json_syntax_conceal = 0

" choosewin
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
