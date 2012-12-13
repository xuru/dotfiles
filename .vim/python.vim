
let g:pymode_folding = 0

" Pylint configuration file
let g:pymode_lint_config=$HOME."/.pylintrc"

" run pep8+pyflakes validator
"autocmd FileType python map <buffer> ,8 :call Flake8()<CR>
" rules to ignore (example: "E501,W293")
"let g:flake8_ignore="W391"

" don't let pyflakes allways override the quickfix list
"let g:pyflakes_use_quickfix = 0


ab shabang #!/usr/bin/python
ab utf8 # -*- coding: utf-8 -*-
ab ifmain if __name__ == "__main__":
