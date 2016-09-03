
" Virtualenv support
let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '{%n}'

if exists("*virtualenv#statusline")
    set statusline+=%{virtualenv#statusline()}\ 
endif
