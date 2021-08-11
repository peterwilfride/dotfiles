call plug#begin('~/.vim/plugged')

Plug 'terroo/vim-simple-emoji'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
Plug 'gko/vim-coloresque'
Plug 'chrisbra/colorizer'
Plug 'lilydjwg/colorizer'
Plug 'ervandew/supertab'

call plug#end()

set nu!
set mouse=a
set title
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

map <C-q> :quit<CR>
map <C-s> :write<CR>

let g:airline_theme = 'jellybeans'

" JELLYBEANS
colorscheme jellybeans

let g:jellybeans_use_term_italics = 1

let g:jellybeans_overrides = {
\    'Comment': { 'guifg': 'cccccc' },
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif
