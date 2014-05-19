
"-------------------
" Autocommands (all)
" ------------------
if has("autocmd")

    " In all files, try to jump back to the last spot cursor was in before exiting
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

    " don't fold vim files
    au FileType vim set nofoldenable

    " css - requires csstidy
    au filetype css setlocal equalprg=/Users/plaster/bin/csstidy\ -\ --silent=true

    " open .applescript files as .scpt files...
    au BufRead,BufNewFile *.applescript setfiletype applescript
    au BufRead,BufNewFile *.scpt setfiletype applescript

    " Re-load vimrc file when you save
    "au BufWritePost ~/.vimrc :source ~/.vimrc
    "au BufWritePost ~/.gvimrc :source ~/.gvimrc
    "
    augroup json_filetype
    autocmd!
    autocmd BufNewFile,BufRead *.json set filetype=javascript
    augroup END

    " tablength exceptions
    autocmd FileType html setlocal shiftwidth=2 tabstop=2
    autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

    " fish shell
    autocmd FileType fish compiler fish
    autocmd FileType fish setlocal textwidth=79
    autocmd FileType fish setlocal foldmethod=expr
endif

