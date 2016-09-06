
if isdirectory(expand("~/.vim/plugged/ctrlp.vim"))
    let g:ctrlp_match_window = 'bottom,order:ttb'
    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

    " CtrlP (new fuzzy finder)
    " let g:ctrlp_map = ',e'
    nmap ,g :CtrlPBufTag<CR>
    nmap ,G :CtrlPBufTagAll<CR>
    nmap ,f :CtrlPLine<CR>
    nmap ,m :CtrlPMRUFiles<CR>

    " to be able to call CtrlP with default search text
    function! CtrlPWithSearchText(search_text, ctrlp_command_end)
        execute ':CtrlP' . a:ctrlp_command_end
        call feedkeys(a:search_text)
    endfunction

    " CtrlP with default text
    nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
    nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
    nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
    "nmap ,d ,wg
    "nmap ,D ,wG
    nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
    nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
    nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>

    " Don't change working directory
    let g:ctrlp_working_path_mode = 0

    " Ignore files on fuzzy finder
    let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](\.git|\.hg|\.svn)$',
      \ 'file': '\.pyc$\|\.pyo$',
      \ }
endif
