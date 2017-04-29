" Configuration for Tagbar

if isdirectory(expand("~/.vim/plugged/tagbar"))
    " Mapping
    map <F4> :TagbarToggle<CR>

    " autofocus on Tagbar open
    let g:tagbar_autofocus = 1
    let g:tagbar_compact = 1

    " ctags
    " let g:vim_tags_use_vim_dispatch = 1
    let g:tagbar_type_css = {
    \ 'ctagstype' : 'Css',
        \ 'kinds'     : [
            \ 'c:classes',
            \ 's:selectors',
            \ 'i:identities'
        \ ]
    \ }
endif
