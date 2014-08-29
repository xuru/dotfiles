
let g:pymode = 1
let g:pymode_doc = 1

let g:pymode_folding = 0

" Pylint configuration file
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_config="/Users/eplaster/.pylintrc"
let g:pymode_lint_ignore = "E265,W0232,C0103,R0903,F0401,E0611,E501,E1101,C0301,C0111,C0110"
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_sort = ['E', 'C', 'I']

" Rope
"let g:pymode_rope = 0
"let g:pymode_rope_lookup_project = 0
"let g:pymode_rope_auto_project = 1
"let g:pymode_rope_regenerate_on_write = 1

" Rope Find Definition
"let g:pymode_rope_goto_definition_bind = '<leader>d'
"let g:pymode_rope_goto_definition_cmd = 'e'

" Rope Refactoring
"let g:pymode_rope_rename_bind = '<leader>r'
"let g:pymode_rope_organize_imports_bind = '<leader>oi'
"let g:pymode_rope_autoimport_bind = '<leader>imp'

" Rope Completion
"let g:pymode_rope_completion = 1
"let g:pymode_rope_complete_on_dot = 1
"let g:pymode_rope_autoimport = 1

let g:pymode_breakpoint_bind = '<leader>p'

let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#popup_select_first = 1
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = 1
let g:jedi#use_splits_not_buffers = 'right'
let g:jedi#use_tabs_not_buffers = 0

" don't let pyflakes allways override the quickfix list
"let g:pyflakes_use_quickfix = 0

ab shabang #!/usr/bin/env python
ab utf8 # -*- coding: utf-8 -*-
ab ifmain if __name__ == "__main__":
