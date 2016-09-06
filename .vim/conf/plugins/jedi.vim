" jedi-vim
""""""""""""""""
if isdirectory(expand("~/.vim/plugged/jedi-vim"))
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#completions_enabled = 0

    let g:jedi#popup_on_dot = 1
    let g:jedi#popup_select_first=0

    let g:jedi#use_tabs_not_buffers = 0
    let g:jedi#show_call_signatures=0

    let g:jedi#goto_command = "<leader>d"
    let g:jedi#goto_assignments_command = "<leader>g"
    let g:jedi#goto_definitions_command = ""
    let g:jedi#documentation_command = "K"
    let g:jedi#usages_command = "<leader>n"
    " let g:jedi#completions_command = "<C-Space>"
    let g:jedi#rename_command = "<leader>r"
endif
