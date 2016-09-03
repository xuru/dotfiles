" Airline configuration
if isdirectory(expand("~/.vim/bundle/vim-airline"))

    set laststatus=2
    set encoding=utf-8 " Necessary to show Unicode glyphs

    let g:airline_powerline_fonts=1
    let g:airline_theme='dark'

    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'

    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'

    let g:airline_branch_prefix = '⭠ '
    let g:airline_readonly_symbol = '⭤'
    let g:airline_linecolumn_prefix = '⭡'

    let g:airline_paste_symbol = 'ρ'
    let g:airline_paste_symbol = 'Þ'
    let g:airline_paste_symbol = '∥'
    let g:airline_whitespace_symbol = 'Ξ'

    let g:airline_section_y = ''
    "let g:airline_section_z = ''

    let g:airline_enable_branch=1
    let g:airline_enable_syntastic=1
    let g:airline_detect_whitespace=2
    let g:airline_theme='powerlineish'

    "let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#branch#enabled = 1
    "let g:airline#extensions#tagbar#enabled = 1
    let g:airline#extensions#virtualenv#enabled = 1

endif
