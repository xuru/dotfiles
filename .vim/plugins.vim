" Modeline and Notes
" vim: set sw=4 ts=4 sts=4 et tw=78 foldlevel=2:
"

filetype off

" Setting up Vundle - the vim plugin bundler
let iCanHazPlug=1
let plugged_file=expand('~/.vim/autoload/plug.vim')
if !filereadable(plugged_file)
    echo "Installing vim-plugged..."
    echo ""
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let iCanHazPlug=0
endif


call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'editorconfig/editorconfig-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
if executable('ag')
    Plug 'mileszs/ack.vim'
    let g:ackprg = 'ag --vimgrep'
elseif executable('ack')
    Plug 'mileszs/ack.vim'
endif

" General
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tyok/nerdtree-ack'

" library for other bundles to support repeat '.' (surrond, abolish)
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-abolish.git'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'

Plug 'jiangmiao/auto-pairs'
" Plug 'kristijanhusak/vim-multiple-cursors'
" Plug 'vim-scripts/sessionman.vim'
" Plug 'matchit.zip'
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
Plug 'bling/vim-bufferline'
Plug 'flazz/vim-colorschemes'
Plug 'jnurmine/Zenburn'
Plug 'vim-scripts/restore_view.vim'

" select regions based on text objects (<ENTER>)
Plug 'gcmt/wildfire.vim'

" General Programming
" Pick one of the checksyntax, jslint, or syntastic
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/syntastic'
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
if executable('ctags')
    Plug 'majutsushi/tagbar'
endif
" Plug 'myint/syntastic-extras'

" Snippets & AutoComplete
Plug 'Valloric/YouCompleteMe', { 'do': '/usr/local/bin/python3 ./install.py'  }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Python
" integrates Python documentation system into Vim
Plug 'fs111/pydoc.vim'
Plug 'davidhalter/jedi-vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tmhedberg/SimpylFold'
Plug 'jmcantrell/vim-virtualenv'
Plug 'mitsuhiko/vim-jinja'

" Misc
Plug 'tpope/vim-markdown'
Plug 'rizzatti/dash.vim'
Plug 'aklt/plantuml-syntax'
Plug 'szw/vim-tags'

call plug#end()

filetype plugin indent on " required!

" Installing plugins the first time
if iCanHazPlug == 0
    echo "Installing plugins, please ignore key map error messages"
    echo ""
    :PlugInstall
endif

