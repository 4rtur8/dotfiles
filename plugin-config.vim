"lighline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

hi LineNr guibg=#2c3038
hi LineNr guifg=#636d80


set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

set listchars=tab:\|\ 
set list


"nerdtree
let NERDTreeQuitOnOpen=1

"ident guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#2c3038   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#636d80 ctermbg=4

" Prettier
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"nmap <leader>p  <Plug>(coc-format-selected)

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

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'


