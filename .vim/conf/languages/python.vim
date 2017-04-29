
augroup python_autogroup
    autocmd!
    " removes trailing spaces of python files (and restores cursor position)
    autocmd BufWritePre *.py mark z | %s/ *$//e | 'z
augroup END

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

" nmap <F6> :! ipython -c "\%run %"<CR>
" nmap <Leader>b :normal Oipdb<Tab><CR>
" setlocal expandtab tabstop=4 shiftwidth=4 tw=79
" let python_highlight_all = 1
" nnoremap <Leader>j <c-c>g<CR>

