au BufNewFile,BufRead *.qbs,*.qbp set filetype=javascript
au FileType js, javascript setlocal foldmethod=syntax foldlevel=0

" Auto complete options for JavaScript
autocmd FileType javascript set omnifunc=tern#Complete

" JavaScript indentation
au FileType javascript setlocal expandtab shiftwidth=2 tabstop=2

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" eslint config file higthlithing
autocmd BufNewFile,BufRead .eslintrc set ft=json
