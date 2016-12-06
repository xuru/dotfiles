
"-----------------------
" Markdown configuration
"-----------------------

let g:vim_markdown_folding_disabled=1

" .md files should be treated as Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Spell check markdown files
autocmd FileType markdown setlocal spell

" Automatically wrap at 80 characters
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/home/uralbash/.vim/submodules/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
