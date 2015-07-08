
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

" Deps
Bundle 'gmarik/vundle'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
if executable('ag')
    Bundle 'mileszs/ack.vim'
elseif executable('ack-grep')
    Bundle 'mileszs/ack.vim'
elseif executable('ack')
    Bundle 'mileszs/ack.vim'
endif
Bundle 'tpope/vim-dispatch'

" Colors
Bundle 'jnurmine/Zenburn'

"Bundle 'ctrlpvim/ctrlp.vim'
"Bundle 'tacahiroy/ctrlp-funky'
Bundle 'Shougo/unite.vim'

" Nerd...
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tyok/nerdtree-ack'

Bundle 'bling/vim-airline'

"Bundle 'flazz/vim-colorschemes'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'spf13/vim-colors'
"Bundle 'jiangmiao/auto-pairs'
"Bundle 'kristijanhusak/vim-multiple-cursors'
"Bundle 'matchit.zip'
"Bundle 'bling/vim-bufferline'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'mbbill/undotree'
"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'vim-scripts/restore_view.vim'
"Bundle 'mhinz/vim-signify'
"Bundle 'tpope/vim-abolish.git'
"Bundle 'osyo-manga/vim-over'
"Bundle 'kana/vim-textobj-user'
"Bundle 'kana/vim-textobj-indent'
"Bundle 'gcmt/wildfire.vim'

"Bundle 'reedes/vim-litecorrect'
"Bundle 'reedes/vim-textobj-sentence'
"Bundle 'reedes/vim-textobj-quote'
"Bundle 'reedes/vim-wordy'

" RST and view it in realtime in a browser
"Bundle 'Rykka/riv.vim'
"Bundle 'Rykka/InstantRst'

" General Programming
Bundle 'scrooloose/syntastic'
Bundle 'myint/syntastic-extras'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'

"Plugin 'gregsexton/gitv'
"Bundle 'mattn/webapi-vim'
"Bundle 'mattn/gist-vim'
"Bundle 'godlygeek/tabular'
if executable('ctags')
    Bundle 'majutsushi/tagbar'
endif

" Snippets & AutoComplete
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'ervandew/supertab'

Bundle 'Raimondi/delimitMate'

" Languages
Bundle 'tpope/vim-markdown'
"Bundle 'elzr/vim-json'
"Bundle 'groenewege/vim-less'
"Bundle 'pangloss/vim-javascript'
"Bundle 'briancollins/vim-jst'
"Bundle 'kchmck/vim-coffee-script'
"Plugin 'vim-ruby/vim-ruby'
"Bundle 'kylef/apiblueprint.vim'
"Bundle 'amirh/HTML-AutoCloseTag'
"Bundle 'hail2u/vim-css3-syntax'
"Bundle 'gorodinskiy/vim-coloresque'
"Bundle 'tpope/vim-haml'
"Bundle 'saltstack/salt-vim'

" Python
"Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Plugin 'hynek/vim-python-pep8-indent'
Bundle 'yssource/python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'mitsuhiko/vim-jinja'
"Bundle 'alfredodeza/coveragepy.vim'

" Misc
"Bundle 'spf13/vim-preview'
"Bundle 'cespare/vim-toml'
"Bundle 'vim-scripts/Gundo'
Bundle 'rizzatti/dash.vim'
Bundle 'aklt/plantuml-syntax'
Bundle 'szw/vim-tags'


" --------- Docs --------------------

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

