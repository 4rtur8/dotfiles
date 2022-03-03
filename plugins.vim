call plug#begin('~/.vim/plugged')

" THEMES
Plug 'arcticicestudio/nord-vim'
Plug 'drewtempelmeyer/palenight.vim'

"syntax
Plug 'tomlion/vim-solidity'
Plug 'digitaltoad/vim-pug'
Plug 'posva/vim-vue'

"statusbar
Plug 'itchyny/lightline.vim'

"tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"typing
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

"comments
Plug 'preservim/nerdcommenter'

"autocomplete
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"ide
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'

"linter
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'

call plug#end()
