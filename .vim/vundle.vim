
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
" original repos on github
Bundle 'tpope/vim-fugitive'

Bundle 'Raimondi/delimitMate'
Bundle 'docunext/closetag.vim'

Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'

Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jnurmine/Zenburn'
Bundle 't9md/vim-chef'


Bundle 'mileszs/ack.vim'
Bundle 'reinh/vim-makegreen'
Bundle 'vim-scripts/vcscommand.vim'
Bundle 'kien/ctrlp.vim'

Bundle 'vim-scripts/YankRing.vim'

" Javascript... must install jshint (npm install jshint)
Bundle 'walm/jshint.vim'
Bundle 'leshill/vim-json'

" Python
Bundle 'klen/python-mode'
"Bundle 'fisadev/vim-debug.vim'
"Bundle 'nvie/vim-flake8'
"Bundle 'finder/rope-vim'
"Bundle 'rygwdn/rope-omni'
"Bundle 'fs111/pydoc.vim'

" Zen coding
Bundle 'mattn/zencoding-vim'

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

