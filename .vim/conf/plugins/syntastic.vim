" Syntastic

if isdirectory(expand("~/.vim/plugged/syntastic"))
    let g:syntastic_python_checkers = ["flake8", "mccabe"]
    let g:syntastic_python_flake8_args='--ignore=F403,E301,E501,E221,E202,E251,E731,W391,W291,E701,W293,E121,E122,E123,E124,E125,E126,E127,E128,E502,E711,E712,E721,C901,N801,N802,N803,N804,N805,N806,N811,N812,W503 --max-complexity=18 --max-line-length=120'

    let g:syntastic_rst_checkers = ["rstcheck"]
    let g:syntastic_yaml_checkers = ["jsyaml"]
    let g:syntastic_markdown_checkers = ["mdl"]
    let g:syntastic_javascript_checkers = ["jshint"]
    let g:syntastic_css_checkers = ["csslint"]

    " show list of errors and warnings on the current file
    nmap <leader>e :Errors<CR>

    if exists("*SyntasticStatuslineFlag")
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
    endif

    let g:syntastic_aggregate_errors = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 1
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_auto_jump = 0
    let g:syntastic_enable_highlighting = 1

    " don't put icons on the sign column (it hides the vcs status icons of signify)
    let g:syntastic_enable_signs = 0
    " custom icons (enable them if you use a patched font, and enable the previous
    " setting)
    "let g:syntastic_error_symbol = '✗'
    "let g:syntastic_warning_symbol = '⚠'
    "let g:syntastic_style_error_symbol = '✗'
    "let g:syntastic_style_warning_symbol = '⚠'

    fun! Check_syntax()
      :let b:syntastic_skip_checks=0
      :SyntasticCheck
    endfun
    nnoremap <C-l> :call Check_syntax()<CR>
endif
