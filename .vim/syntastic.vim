let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_checker_args='--ignore=E501,E225,E265,F403 --max-complexity 10'

let g:syntastic_rst_checkers = ["rstcheck"]
let g:syntastic_yaml_checkers = ["jsyaml"]
let g:syntastic_markdown_checkers = ["mdl"]
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_css_checkers = ["csslint"]

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" check also when just opened the file
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_auto_loc_list = 1

" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'

