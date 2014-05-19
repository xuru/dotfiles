
let g:pymode_folding = 0

" Pylint configuration file
let g:pymode_lint_config="/Users/eplaster/.pylintrc"

" Rope
let g:pymode_rope = 1
let g:pymode_rope_lookup_project = 1
let g:pymode_rope_rename_bind = '<leader>r'
let g:pymode_rope_goto_definition_bind = '<leader>d'
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_auto_project = 1
let g:pymode_rope_regenerate_on_write = 1

let g:pymode_lint_ignore = "E265,W0232,C0103,R0903,F0401,E0611,E501,E1101,C0301,C0111,C0110"

" don't let pyflakes allways override the quickfix list
"let g:pyflakes_use_quickfix = 0


ab shabang #!/usr/bin/env python
ab utf8 # -*- coding: utf-8 -*-
ab ifmain if __name__ == "__main__":    
