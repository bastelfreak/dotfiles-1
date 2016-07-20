syntax on
set ts=4 sts=4 sw=4 et tw=72 
set magic
set bg=light
highlight Pmenu ctermbg=black ctermfg=white
highlight PmenuSel ctermbg=white ctermfg=black
filetype plugin on
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
let g:airline_powerline_fonts = 1
