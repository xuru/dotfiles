" search
set hlsearch                    " Highlight search terms
set incsearch                   " Find as you type search
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

let g:ack_default_options = " -H --nocolor --nogroup --column"
let g:ackpreview = 0

nmap <leader>a <ESC>:Ack<CR>
nmap <C-n> <ESC>:cnext<CR>
nmap <C-p> <ESC>:cprev<CR>
