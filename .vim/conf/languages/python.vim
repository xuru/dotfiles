
augroup python_autogroup
    autocmd!
    " removes trailing spaces of python files (and restores cursor position)
    autocmd BufWritePre *.py mark z | %s/ *$//e | 'z
    autocmd FileType python :set makeprg=python\ %
augroup END

autocmd FileType python setlocal omnifunc=RopeCompleteFunc

" Nerd commenter
let g:NERDSpaceDelims = 1

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

" Rope
let ropevim_codeassist_maxfixes=10
let ropevim_guess_project=1
let ropevim_vim_completion=1
let ropevim_enable_autoimport=0
let ropevim_extended_complete=1 
let ropevim_enable_shortcuts=0
autocmd FileType python setlocal omnifunc=RopeCompleteFunc

map <leader>g :call RopeGotoDefinition()<cr>
map <leader>d :call RopeShowDoc()<cr>
map <leader>rm :RopeExtractMethod<cr>
map <leader>ri :call RopeOrganizeImports()<cr>
map <leader>rr :call RopeRename()<cr>
map <leader>rc :call RopeShowCalltip()<cr>

ab shabang #!/usr/bin/env python
ab utf8 # -*- coding: utf-8 -*-
ab ifmain if __name__ == "__main__":

" Virtualenv support
let g:virtualenv_auto_activate = 1
