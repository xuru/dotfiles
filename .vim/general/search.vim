
let g:ack_default_options = " -H --nocolor --nogroup --column"
let g:ackpreview = 0

nmap <leader>a <ESC>:Ack<CR>
nmap <C-n> <ESC>:cnext<CR>
nmap <C-p> <ESC>:cprev<CR>

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    " let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
elseif executable('ack-grep')
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif
