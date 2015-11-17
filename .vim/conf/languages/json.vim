"
" vim-json configuration
"

" format json code
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>

" Disable concealing
let g:vim_json_syntax_conceal = 0
