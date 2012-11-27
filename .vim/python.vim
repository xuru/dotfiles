
" Pylint configuration file
let g:pymode_lint_checker = "pyflakes,mccabe"

" If file not found use 'pylintrc' from python-mode plugin directory
let g:pymode_lint_config = "$HOME/.pylintrc"

" run pep8+pyflakes validator
"autocmd FileType python map <buffer> ,8 :call Flake8()<CR>
" rules to ignore (example: "E501,W293")
"let g:flake8_ignore="W391"

" don't let pyflakes allways override the quickfix list
"let g:pyflakes_use_quickfix = 0

" ropevim omnicompleter https://github.com/rygwdn/rope-omni
autocmd FileType python setlocal omnifunc=RopeCompleteFunc

