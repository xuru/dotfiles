
" Rope
if isdirectory(expand("~/.vim/plugged/ropevim"))
    let ropevim_codeassist_maxfixes=10
    let ropevim_guess_project=1
    let ropevim_vim_completion=1
    let ropevim_enable_autoimport=1
    let ropevim_extended_complete=1
    let ropevim_enable_shortcuts=0

    autocmd FileType python setlocal omnifunc=RopeCompleteFunc

    map <leader>g :call RopeGotoDefinition()<cr>
    map <leader>d :call RopeShowDoc()<cr>
    map <leader>rm :RopeExtractMethod<cr>
    map <leader>ro :call RopeOrganizeImports()<cr>
    map <leader>ri :call RopeAutoImport()<cr>
    map <leader>rr :call RopeRename()<cr>
    map <leader>rc :call RopeShowCalltip()<cr>
endif
