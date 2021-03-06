" abyr

" execute pathogen#infect()

colorscheme wombat256
" colorscheme desert
" colorscheme slate

filetype off
filetype plugin indent on

set background=dark
set nu
set syntax=on
set nocompatible
set ofu=syntaxcomplete#Complete
set shortmess=a
set softtabstop=4
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
set linebreak
set et
set wrap
set ai
set cin
set ruler
set showmatch
set hlsearch
set incsearch
set nohlsearch
set ignorecase
set lz
set listchars=tab:··
set list
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
set showcmd
set mouse=a
set mousemodel=popup
set guioptions-=T
set guioptions-=m
set novisualbell
set nobackup
set noswapfile

" remove unwanted whitespaces
autocmd BufWritePre * :%s/\s\+$//e

set encoding=utf8

filetype plugin on
syntax on

" status line format
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2

" Fix <Enter> for comment
set fo+=cr


" hotkeys

" CTRL-F for omni completion
imap <C-F> <C-X><C-O>

" del line ^+e
" map <C-e> dd
" imap <C-e> <esc>ddi

" copy line ^+d
" nmap <C-d> yypi
" map <C-d> <esc>yypi

" quick save
" nmap <F2> :w<cr>
" vmap <F2> <esc>:w<cr>i
" imap <F2> <esc>:w<cr>i
" nmap <C-s> :w<cr>
" vmap <C-s> <esc>:w<cr>
" imap <C-s> <esc>:w<cr>i

" F3 - File browser
nmap <F3> :NERDTreeToggle<cr>
imap <F3> <esc>:NERDTreeToggle<cr>

" F4 - Taglist
map <F4> :TlistToggle<cr>
vmap <F4> <esc>:TlistToggle<cr>
imap <F4> <esc>:TlistToggle<cr>

" buffers

" F5 - show buffers
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F6 - prev buff
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - next buff
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" F8 - PHP syntax check
" map <F8> :!php -l %<cr>

" F9 - exit
set wildmenu
set wcm=<Tab>
menu Exit.quit     :quit<CR>
menu Exit.quit!    :quit!<CR>
menu Exit.save     :exit<CR>
menu Exit.bdelete :bdelete<CR>
menu Exit.bdelete! :bdelete!<CR>
map <F9> :emenu Exit.<Tab>

" switch window
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" resize horzontal split window
nmap <silent> <C-S-Down> <C-W>-<C-W>-
nmap <silent> <C-S-Up> <C-W>+<C-W>+
" resize vertical split window
nmap <silent> <C-S-Left> <C-W>><C-W>>
nmap <silent> <C-S-Right> <C-W><<C-W><

function! InsertTabWrapper(direction)
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  elseif "backward" == a:direction
    return "\<c-p>"
  else
    return "\<c-n>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

let Tlist_Use_Right_Window   = 1

if &readonly == 1
    set nofoldenable
    nmap <F10> :qa<cr>
    nmap <Esc> :qa!<CR>
    nmap <Space> <PageDown>
endif

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_javascript_checkers=['jshint']

if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
set wildignore+=*.pyc*,*.sql*
set wildignore+=*/node_modules/*
set wildignore+=*js-build/*
set wildignore+=*log*,*.sh*
set wildignore+=*.py*
set wildignore+=*.css*
let g:ctrlp_clear_cache_on_exit=0

set complete=""
set complete+=.
set complete+=k
set complete+=b
set completeopt-=preview
set completeopt+=longest

" end
