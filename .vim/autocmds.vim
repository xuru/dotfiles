
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
    autocmd FileType vim set nofoldenable

    " xml - requires xmllint
    au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

    " css - requires csstidy
    autocmd filetype css setlocal equalprg=/Users/plaster/bin/csstidy\ -\ --silent=true

    " open .applescript files as .scpt files...
    au BufRead,BufNewFile *.applescript setfiletype applescript
    au BufRead,BufNewFile *.scpt setfiletype applescript

    " Re-load vimrc file when you save
    "au BufWritePost ~/.vimrc :source ~/.vimrc
    "au BufWritePost ~/.gvimrc :source ~/.gvimrc
endif

