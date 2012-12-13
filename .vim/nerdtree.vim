
"-----------------------
" NERDTree configuration
"-----------------------

" Increase window size to 35 columns
let NERDTreeWinSize=35

" map <F2> to toggle NERDTree window
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\env','\.vim$', '\~$', '\.pyc$', '\.swp$', '\.egg-info$', '^dist$', '^build$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeHightlightCursorline=1

" To close window when there is only NERDTree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Uncomment if you want NERDTree to open automatically when you open vim (with
" a file
"autocmd vimenter * NERDTree


