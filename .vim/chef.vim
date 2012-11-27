
"-------------------
" Chef
" ------------------
au BufNewFile,BufRead */*cookbooks/*  call s:SetupChef()
function! s:SetupChef()
    " Mouse:
    " Left mouse click to GO!
    nnoremap <buffer> <silent> <2-LeftMouse> :<C-u>ChefFindAny<CR>
    " Right mouse click to Back!
    nnoremap <buffer> <silent> <RightMouse> <C-o>

    " Keyboard:
    nnoremap <buffer> <silent> <M-a>      :<C-u>ChefFindAny<CR>
    nnoremap <buffer> <silent> <M-f>      :<C-u>ChefFindAnySplit<CR>
endfunction

