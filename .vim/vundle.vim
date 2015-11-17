" Modeline and Notes 
" vim: set sw=4 ts=4 sts=4 et tw=78 foldlevel=2:
"
"   You can find me at http://spf13.com
" 

" Environment 

    " Basics 
        set nocompatible        " Must be first line
        set background=dark     " Assume a dark background
    " 

    " Windows Compatible 
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if has('win32') || has('win64')
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after

          " Be nice and check for multi_byte even if the config requires
          " multi_byte support most of the time
          if has("multi_byte")
            " Windows cmd.exe still uses cp850. If Windows ever moved to
            " Powershell as the primary terminal, this would be utf-8
            set termencoding=cp850
            " Let Vim use utf-8 internally, because many scripts require this
            set encoding=utf-8
            setglobal fileencoding=utf-8
            " Windows has traditionally used cp1252, so it's probably wise to
            " fallback into cp1252 instead of eg. iso-8859-15.
            " Newer Windows files might contain utf-8 or utf-16 LE so we might
            " want to try them first.
            set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15
          endif
        endif
    " 

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
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
        if executable('ag')
            Bundle 'mileszs/ack.vim'
            let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
        elseif executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            Bundle 'mileszs/ack.vim'
        elseif executable('ack')
            Bundle 'mileszs/ack.vim'
        endif
    " 


    " General 
        Bundle 'scrooloose/nerdtree'
        Bundle 'tpope/vim-surround'
        Bundle 'tpope/vim-repeat'
        Bundle 'jiangmiao/auto-pairs'
        Bundle 'ctrlpvim/ctrlp.vim'
        Bundle 'tacahiroy/ctrlp-funky'
        Bundle 'kristijanhusak/vim-multiple-cursors'
        Bundle 'vim-scripts/sessionman.vim'
        Bundle 'matchit.zip'
        Bundle 'bling/vim-airline'
        Bundle 'powerline/fonts'
        Bundle 'bling/vim-bufferline'
        Bundle 'Lokaltog/vim-easymotion'
        Bundle 'jistr/vim-nerdtree-tabs'
        Bundle 'tyok/nerdtree-ack'
        Bundle 'flazz/vim-colorschemes'
        Bundle 'jnurmine/Zenburn'
        Bundle 'mbbill/undotree'
        Bundle 'nathanaelkane/vim-indent-guides'
        Bundle 'vim-scripts/restore_view.vim'
        Bundle 'mhinz/vim-signify'
        Bundle 'tpope/vim-abolish.git'
        Bundle 'osyo-manga/vim-over'
        Bundle 'kana/vim-textobj-user'
        Bundle 'kana/vim-textobj-indent'
        Bundle 'gcmt/wildfire.vim'
    " 

    " General Programming 
        " Pick one of the checksyntax, jslint, or syntastic
        Bundle 'scrooloose/syntastic'
        Bundle 'tpope/vim-fugitive'
        Bundle 'airblade/vim-gitgutter'
        Bundle 'mattn/webapi-vim'
        Bundle 'mattn/gist-vim'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'tpope/vim-commentary'
        Bundle 'godlygeek/tabular'
        if executable('ctags')
            Bundle 'majutsushi/tagbar'
        endif
        Bundle 'myint/syntastic-extras'
    " 

    " Snippets & AutoComplete 
        Bundle 'Valloric/YouCompleteMe'
        Bundle 'SirVer/ultisnips'
        Bundle 'honza/vim-snippets'
    " 
    
    " Python 
        " Pick either python-mode or pyflakes & pydoc
        "Bundle 'klen/python-mode'
        "Bundle 'davidhalter/jedi-vim'
        Bundle 'python-rope/ropevim'
        Bundle 'yssource/python.vim'
        Bundle 'python_match.vim'
        Bundle 'pythoncomplete'
        Plugin 'hynek/vim-python-pep8-indent'
        Bundle 'jmcantrell/vim-virtualenv'
        Bundle 'mitsuhiko/vim-jinja'
    " 

    " Javascript 
        Bundle 'elzr/vim-json'
        Bundle 'groenewege/vim-less'
        Bundle 'pangloss/vim-javascript'
        Bundle 'briancollins/vim-jst'
        Bundle 'kchmck/vim-coffee-script'
    " 

    " HTML 
        Bundle 'amirh/HTML-AutoCloseTag'
        Bundle 'hail2u/vim-css3-syntax'
        Bundle 'gorodinskiy/vim-coloresque'
        Bundle 'tpope/vim-haml'
    " 

    " Ruby 
        Bundle 'tpope/vim-rails'
        let g:rubycomplete_buffer_loading = 1
        "let g:rubycomplete_classes_in_global = 1
        "let g:rubycomplete_rails = 1
    " 

    " Go Lang 
        "Bundle 'Blackrush/vim-gocode'
        Bundle 'fatih/vim-go'
    " 

    " Misc 
        Bundle 'rust-lang/rust.vim'
        Bundle 'tpope/vim-markdown'
        Bundle 'spf13/vim-preview'
        Bundle 'cespare/vim-toml'
        Bundle 'saltstack/salt-vim'
        Bundle 'rizzatti/dash.vim'
        Bundle 'aklt/plantuml-syntax'
        Bundle 'szw/vim-tags'
        Plugin 'pzxbc/vim-kv'
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

