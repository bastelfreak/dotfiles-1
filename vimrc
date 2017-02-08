syntax on
set ts=4 sts=4 sw=4 et tw=72 
set magic
set bg=light
highlight Pmenu ctermbg=black ctermfg=white
highlight PmenuSel ctermbg=white ctermfg=black
filetype plugin on
filetype plugin indent on
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee > /dev/null %
set wildmenu
set hidden
set nohlsearch
set autoindent
set smartindent
"set number
set showmatch
set showcmd
set incsearch
set ttyfast
" We are using a powerline.. so we don't need this
set showmode!
au FileType python setl ts=4 sts=4 sw=4 et tw=79
au FileType c setl ts=8 sts=8 sw=8 et tw=79
au FileType rust setl ts=4 sts=4 sw=4 et tw=79
au FileType xml  setl ts=2 sts=2 sw=2 et tw=79
au BufRead,BufNewFile PKGBUILD set filetype=PKGBUILD
au BufRead,BufNewFile *.install set filetype=INSTALL
au BufRead,BufNewFile Vagrantfile set filetype=Vagrant
au FileType Vagrant setl ts=2 sts=2 sw=2 tw=78 syntax=ruby
au BufRead,BufNewFile ASA-* set filetype=ASA
au FileType ASA setl ts=4 sts=4 sw=4 et tw=72 syntax=mail
au BufNewFile ASA-* call feedkeys("Iarchsec\<TAB>","")
au BufNewFile PKGBUILD call feedkeys("IPKGBUILD\<TAB>"."")
au FileType PKGBUILD setl ts=2 sts=2 sw=2 et tw=79 syntax=sh
au FileType INSTALL setl ts=2 sts=2 sw=2 et tw=79 syntax=sh
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
map <C-J> :bprev!<CR>
map <C-K> :bnext!<CR>
set guifont=PowerlineSymbols
set encoding=utf-8
let g:airline_powerline_fonts = 1
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
packadd matchit
set pastetoggle=<INS>
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
au FileType ruby,haml,yaml,scss,coffee,html setlocal sw=2 ts=2 sts=2 et
let g:sneak#label = 1
