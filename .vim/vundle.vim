" Modeline and Notes 
" vim: set sw=4 ts=4 sts=4 et tw=78 foldlevel=2:
"
"   You can find me at http://spf13.com
" 

" Environment 

    " Setup Bundle Support 
        " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " 

    " Add an UnBundle command 
    function! UnBundle(arg, ...)
      let bundle = vundle#config#init_bundle(a:arg, a:000)
      call filter(g:vundle#bundles, 'v:val["name_spec"] != "' . a:arg . '"')
    endfunction

    com! -nargs=+         UnBundle
    \ call UnBundle(<args>)
    " 

" 

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


" Bundles 
    " Deps 
        Bundle 'gmarik/vundle'
        Plugin 'editorconfig/editorconfig-vim'
        Plugin 'MarcWeber/vim-addon-mw-utils'
        Plugin 'tomtom/tlib_vim'
        if executable('ag')
            Plugin 'mileszs/ack.vim'
            let g:ackprg = 'ag --vimgrep'
        elseif executable('ack')
            Plugin 'mileszs/ack.vim'
        endif

    " General 
        Plugin 'scrooloose/nerdtree'
        Plugin 'jistr/vim-nerdtree-tabs'
        Plugin 'tyok/nerdtree-ack'

        " library for other bundles to support repeat '.' (surrond, abolish)
        Plugin 'tpope/vim-repeat'
        Plugin 'tpope/vim-surround'
        Plugin 'tpope/vim-abolish.git'

        Plugin 'ctrlpvim/ctrlp.vim'
        Plugin 'tacahiroy/ctrlp-funky'

        Plugin 'jiangmiao/auto-pairs'
        " Plugin 'kristijanhusak/vim-multiple-cursors'
        " Plugin 'vim-scripts/sessionman.vim'
        " Plugin 'matchit.zip'
        "
        Plugin 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'
        Plugin 'powerline/fonts'

        Plugin 'bling/vim-bufferline'
        " Plugin 'Lokaltog/vim-easymotion'

        Plugin 'flazz/vim-colorschemes'
        Plugin 'jnurmine/Zenburn'

        " Plugin 'mbbill/undotree'
        " Plugin 'nathanaelkane/vim-indent-guides'
        Plugin 'vim-scripts/restore_view.vim'
        " Plugin 'mhinz/vim-signify'
        " Plugin 'osyo-manga/vim-over'
        " Plugin 'kana/vim-textobj-user'
        " Plugin 'kana/vim-textobj-indent'

        " select regions based on text objects (<ENTER>)
        Plugin 'gcmt/wildfire.vim'

    " General Programming 
        " Pick one of the checksyntax, jslint, or syntastic
        Plugin 'tpope/vim-fugitive'
        Plugin 'airblade/vim-gitgutter'

        Plugin 'scrooloose/syntastic'
        " Plugin 'mattn/webapi-vim'
        " Plugin 'mattn/gist-vim'
        " Plugin 'scrooloose/nerdcommenter'
        Plugin 'tpope/vim-commentary'
        " Plugin 'godlygeek/tabular'
        if executable('ctags')
            Plugin 'majutsushi/tagbar'
        endif
        " Plugin 'myint/syntastic-extras'

    " Snippets & AutoComplete 
        Plugin 'Valloric/YouCompleteMe'
        " Plugin 'SirVer/ultisnips'
        " Plugin 'honza/vim-snippets'

    " Python 
        " Pick either python-mode or pyflakes & pydoc
        " Plugin 'klen/python-mode'
        " Plugin 'python-rope/ropevim'
        "
        " integrates Python documentation system into Vim
        Plugin 'fs111/pydoc.vim'
        Plugin 'davidhalter/jedi-vim'
        Plugin 'hynek/vim-python-pep8-indent'
        Plugin 'tmhedberg/SimpylFold'
        Plugin 'jmcantrell/vim-virtualenv'
        Plugin 'mitsuhiko/vim-jinja'

        " Plugin 'yssource/python.vim'
        " Plugin 'python_match.vim'
        " Plugin 'pythoncomplete'
    " 

    " Javascript 
        " Plugin 'elzr/vim-json'
        " Plugin 'groenewege/vim-less'
        " Plugin 'pangloss/vim-javascript'
        " Plugin 'briancollins/vim-jst'
        " Plugin 'kchmck/vim-coffee-script'
    " 

    " HTML 
        " Plugin 'amirh/HTML-AutoCloseTag'
        " Plugin 'hail2u/vim-css3-syntax'
        " Plugin 'gorodinskiy/vim-coloresque'
        " Plugin 'tpope/vim-haml'
    " 

    " Ruby 
        " Plugin 'tpope/vim-rails'
        " let g:rubycomplete_buffer_loading = 1
        " let g:rubycomplete_classes_in_global = 1
        " let g:rubycomplete_rails = 1
    " 

    " Go Lang 
        " Plugin 'Blackrush/vim-gocode'
        " Plugin 'fatih/vim-go'
    " 

    " Misc 
        " Plugin 'rust-lang/rust.vim'
        Plugin 'tpope/vim-markdown'
        " Plugin 'spf13/vim-preview'
        " Plugin 'cespare/vim-toml'
        " Plugin 'saltstack/salt-vim'
        Plugin 'rizzatti/dash.vim'
        Plugin 'aklt/plantuml-syntax'
        Plugin 'szw/vim-tags'
        " Plugin 'pzxbc/vim-kv'
    " 

" 
    


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

