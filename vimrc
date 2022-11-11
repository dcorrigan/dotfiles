" basic setup
set number
syntax on

" whitespace
set nowrap
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set autoindent " automatically indent to the current level
set backspace=indent,eol,start " backspace through everything in insert mode
autocmd BufWritePre * %s/\s\+$//e " auto-remove trailing whitespace on save

" mappings
let mapleader=" "

nnoremap <leader><leader> <c-^>
nnoremap <Leader>e :e <C-R>=expand('%:h') . '/'<CR>
nnoremap <Leader>cb :let @+=@%<CR>

" debuggers
iabbrev ipdb import ipdb; ipdb.set_trace()<ESC>
iabbrev pry require 'pry'; binding.pry<ESC>

" file types
au BufNewFile,BufRead *.gql set filetype=graphql
au BufNewFile,BufRead *.ejs set filetype=javascript
