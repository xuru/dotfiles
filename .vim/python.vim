
" Nerd commenter
let g:NERDSpaceDelims = 1

"------ flake8 ----------------------------------
" NOTE: replaced with syntastic
"autocmd FileType python map <buffer> <F2> :call Flake8()<CR>
"autocmd BufWritePost *.py :call Flake8()
"let g:flake8_show_in_gutter=1  " show

"let g:flake8_ignore="E501,W293"
"let g:flake8_max_line_length=120
"let g:flake8_max_complexity=10

" jedi-vim
""""""""""""""""
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 1

let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first=0

let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures=0

" to get the popup to work right...
set completeopt=longest,menuone,preview
" highlight Pmenu guibg=lightcyan gui=bold guifg=darkgray

"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8,'mccabe"
"let g:pymode_lint_write = 1
"let g:pymode_virtualenv = 1
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_key = '<leader>b'
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
"let g:pymode_folding = 0
"let g:pymode_trim_whitespaces = 0
"let g:pymode_options_max_line_length = 120

"let g:pymode_rope = 1
"let g:pymode_rope_autoimport = 0
"let g:pymode_rope_goto_definition_bind = '<leader>d'
""" add the name of modules you want to autoimport
"let g:ropevim_autoimport_modules = []
"let g:pymode_rope_goto_def_newwin = "vnew"
"let g:pymode_rope_extended_complete = 0

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" don't let pyflakes allways override the quickfix list
"let g:pyflakes_use_quickfix = 0


" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d syntax=%s :",
        \ &tabstop, &shiftwidth, &textwidth, &filetype)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(0, l:modeline)
endfunction

nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" removes trailing spaces of python files
" (and restores cursor position)
autocmd BufWritePre *.py mark z | %s/ *$//e | 'z

ab shabang #!/usr/bin/env python
ab utf8 # -*- coding: utf-8 -*-
ab ifmain if __name__ == "__main__":

autocmd FileType python :set makeprg=python\ %
