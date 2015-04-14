
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" nerdcommenter
"   https://github.com/scrooloose/nerdcommenter
"
" nerdtree
"   https://github.com/scrooloose/nerdtree
"
" nerdtree tabs
"   https://github.com/jistr/vim-nerdtree-tabs
"
" tyok/nerdtree-ack
"   This plugin add capability to search in folders via NERDtree
"   https://github.com/tyok/nerdtree-ack
"
" vim-scripts/nerdtree-execute
"   https://github.com/vim-scripts/nerdtree-execute
"   Plugin for NERDTree that provides an execute menu item, that executes system 
"   default application for file or directory
"
"
"
" ervandew/supertab
"
"   In insert mode, start typing something and hit <TAB> to tab-complete based on the current context
"
"
" Tagbar
"
"   Tagbar is a vim plugin for browsing the tags of source code files.
"
" ZoomWin
"     When working with split windows, ZoomWin lets you zoom into a window and out again using Ctrl-W o
"     Customizations: Janus binds <leader>zw to :ZoomWin
"
" vim-multiple-cursors
"     Sublime Text's awesome multiple selection feature
"

" Misc.
Bundle 'sickill/vim-pasta'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-dispatch'

" --------- Nerd tree --------------------
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tyok/nerdtree-ack'

" --------- Search --------------------
Bundle 'mileszs/ack.vim'

" --------- Snippets --------------------
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" --------- Syntax Highlighting --------------------
Plugin 'scrooloose/syntastic'

" --------- Version Control --------------------
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" --------- Python --------------------
Bundle 'davidhalter/jedi-vim'
Bundle 'jmcantrell/vim-virtualenv'
"Bundle 'klen/python-mode'
"Bundle 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
"Bundle 'reinh/vim-makegreen'
Bundle 'plasticboy/vim-markdown'

" --------- Other Languages --------------------
" Speial language support
"Bundle 'leshill/vim-json'
" Javascript... must install jshint (npm install jshint)
"Bundle 'walm/jshint.vim'
"Bundle 'hail2u/vim-css3-syntax'
"Bundle 'saltstack/salt-vim'
"Bundle 'vim-scripts/vim-vagrant'
"Bundle 'vim-scripts/applescript.vim'
"Bundle 'othree/xml.vim'


" --------- Widgets --------------------
Bundle 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Bundle 'jnurmine/Zenburn'

" --------- Docs --------------------
" Integrate with Dash.app
Bundle 'rizzatti/dash.vim'
Bundle 'Rykka/riv.vim'

" --------- other --------------------
"Bundle 'jaredly/vim-debug'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
"Bundle 'terryma/vim-multiple-cursors'

filetype plugin indent on " required! 
"
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

