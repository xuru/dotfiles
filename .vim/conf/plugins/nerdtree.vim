
"-----------------------
" NERDTree configuration
"-----------------------

" Increase window size to 35 columns
let NERDTreeWinSize=35

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowBookmarks = 1

" let g:nerdtree_tabs_open_on_gui_startup = 1
" let g:nerdtree_tabs_smart_startup_focus = 1
" let g:nerdtree_tabs_focus_on_files = 1

" map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\env', '\~$', '\.pyc$', '\.swp$', '\.egg-info$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeHightlightCursorline=1

" To close window when there is only NERDTree left
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Uncomment if you want NERDTree to open automatically when you open vim (with " a file)
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ----- nerd tree tabs -----
map <F3> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
" let g:nerdtree_tabs_autofind=1
