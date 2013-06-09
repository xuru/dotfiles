
let g:pymode_folding = 0

" Pylint configuration file
let g:pymode_lint_config=$HOME."/.pylintrc"

let g:pymode_rope_guess_project = 0

" Should be defaults:
let g:pymode_virtualenv = 1
let g:pymode_motion = 1
let g:pymode_folding = 1
let g:pymode_rope = 1
let g:pymode_rope_auto_project = 1

" run pep8+pyflakes validator
"autocmd FileType python map <buffer> ,8 :call Flake8()<CR>
" rules to ignore (example: "E501,W293")
"let g:flake8_ignore="W391"
let g:pymode_lint_ignore = "E501"

" don't let pyflakes allways override the quickfix list
"let g:pyflakes_use_quickfix = 0


ab shabang #!/usr/bin/python
ab utf8 # -*- coding: utf-8 -*-
ab ifmain if __name__ == "__main__":
