
augroup python_autogroup
    autocmd!
    " removes trailing spaces of python files (and restores cursor position)
    autocmd BufWritePre *.py mark z | %s/ *$//e | 'z
    autocmd FileType python :set makeprg=python\ %
augroup END

au FileType python let b:delimitMate_autoclose = 0
let delimitMate_expand_inside_quotes = 0

" Nerd commenter
let g:NERDSpaceDelims = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" to get the popup to work right...
" set completeopt=longest,menuone,preview

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

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

ab shabang #!/usr/bin/env python
ab utf8 # -*- coding: utf-8 -*-
ab ifmain if __name__ == "__main__":

" Allow nested quoting in Python
au FileType python let b:delimitMate_nesting_quotes = ['"',"'"]
au FileType python let b:delimitMate_expand_cr = 0

" Virtualenv support
let g:virtualenv_auto_activate = 1
