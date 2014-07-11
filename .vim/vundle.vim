
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
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tyok/nerdtree-ack'

Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'

" python testing...
Bundle 'lambdalisue/nose.vim'

Bundle 'vim-scripts/ZoomWin'

Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/vcscommand.vim'

Bundle 'Raimondi/delimitMate'
Bundle 'docunext/closetag.vim'
Bundle 'ervandew/supertab'

" Speial language support
Bundle 'leshill/vim-json'
" Javascript... must install jshint (npm install jshint)
Bundle 'walm/jshint.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'klen/python-mode'
Bundle 'saltstack/salt-vim'
Bundle 'vim-scripts/vim-vagrant'
Bundle 'Rykka/riv.vim'
Bundle 'vim-scripts/applescript.vim'
"Bundle 'mattn/emmet-vim'  " html and css short cut/abbr expander
Bundle 'othree/xml.vim'

Bundle 'majutsushi/tagbar'
" TODO: move to bling/vim-airline
Bundle 'Lokaltog/powerline'
Bundle 'jnurmine/Zenburn'
Bundle 'reinh/vim-makegreen'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors'

" Integrate with Dash.app
Bundle 'rizzatti/dash.vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/greper.vim'

" work with fish scripts
Bundle 'plasticboy/vim-markdown'

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

