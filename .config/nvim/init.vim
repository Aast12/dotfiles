set number                 " Sets line numbers
set autoindent             " Sets auto indentation
set tabstop=4              " Sets tabstop
set shiftwidth=4           " For proper indentation
set smarttab               " Affects how tab key presses are interpreted
set softtabstop=4          " Control how many columns Vim uses when you hit tab key
set mouse=a                " This lets you use your mouse
set wrap                   " Sets up line wrapping

call plug#begin()

" Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ayu-theme/ayu-vim' 
Plug 'andweeb/presence.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree' |
           \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'

call plug#end()

lua require('lualine').setup()

" Keybindings

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu
