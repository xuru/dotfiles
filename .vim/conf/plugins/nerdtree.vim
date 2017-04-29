
"-----------------------
" NERDTree configuration
"-----------------------

if isdirectory(expand("~/.vim/plugged/nerdtree"))

    " Increase window size to 35 columns
    let NERDTreeWinSize=35

    " let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    let NERDTreeShowBookmarks = 1

    " Show hidden files in NerdTree
    let NERDTreeShowHidden=1

    " map <F3> :NERDTreeToggle<CR>
    let NERDTreeIgnore=['\env', '\~$', '\.pyc$', '\.swp$', '\.egg-info$', '__pycache__']
    let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
    let NERDTreeHightlightCursorline=1

    "Shortcut for NERDTreeToggle
    nmap <leader>nt :NERDTreeToggle <CR>
endif

if isdirectory(expand("~/.vim/plugged/vim-nerdtree-tabs"))
    " ----- nerd tree tabs -----

    " Open NERDTree on gvim/macvim startup
    let g:nerdtree_tabs_open_on_gui_startup = 1

    " Open NERDTree on console vim startup
    let g:nerdtree_tabs_open_on_console_startup = 1

    " On startup, focus NERDTree if opening a directory, focus file if opening a file
    let g:nerdtree_tabs_smart_startup_focus = 1

    " Close current tab if there is only one window in it and it's NERDTree (default is 1)
    let g:nerdtree_tabs_autoclose = 1

    " When switching into a tab, make sure that focus is on the file window, not in the NERDTree window
    let g:nerdtree_tabs_focus_on_files = 1

    " Automatically find and select currently opened file in NERDTree
    let g:nerdtree_tabs_autofind=1
endif
