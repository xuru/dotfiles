au BufNewFile,BufRead *.jinja2 set filetype=jinja2

" Django autocomplete options
au FileType html set filetype=htmldjango
au FileType jinja2 set filetype=htmldjango
au FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.jinja,*.jinja2 set ft=jinja
au FileType htmldjango setlocal expandtab shiftwidth=2 tabstop=2

