call plug#begin('~/.vim/plugged')

" THEMES

Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'arcticicestudio/nord-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'preservim/nerdcommenter'
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomlion/vim-solidity'

call plug#end()

" color scheme

syntax on
set clipboard+=unnamedplus

colorscheme nord
filetype plugin on
set t_Co=256
set cursorline
set number
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

hi LineNr guibg=#2c3038
hi LineNr guifg=#636d80

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

set listchars=tab:\|\ 
set list

" KEYMAP

let mapleader=" "

" NerdTree
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

"ident guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#2c3038   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#636d80 ctermbg=4

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>p  <Plug>(coc-format-selected)
" ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
" Fix files with eslint, and then ESLint.
let g:ale_fixers = ['eslint']
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" Run both javascript and vue linters for vue files.
let b:ale_linter_aliases = ['javascript', 'vue']
" Select the eslint and vls linters.
let b:ale_linters = ['eslint', 'vls']
"easymotion
nmap <Leader>s <Plug>(easymotion-overwin-f)

"fzf
nnoremap <C-l> :Files<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-f> :Rg 
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'


"COC
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" copy/ paste
vnoremap <C-c> "+y
map <C-p> "+P


command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
" TRUE COLORS

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif
