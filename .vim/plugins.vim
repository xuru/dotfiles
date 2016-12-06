" Modeline and Notes
" vim: set sw=4 ts=4 sts=4 et tw=78 foldlevel=2:
"

" vim-plug (https://github.com/junegunn/vim-plug)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
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
Plug 'scrooloose/nerdcommenter'
" Plug 'tpope/vim-commentary'
if executable('ctags')
    Plug 'majutsushi/tagbar'
endif
" Plug 'myint/syntastic-extras'

" Snippets & AutoComplete
Plug 'Valloric/YouCompleteMe', { 'do': '/usr/local/bin/python3 ./install.py --all'  }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Python
" Plug 'davidhalter/jedi-vim', { 'do': 'pip install jedi' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'fisadev/vim-isort', { 'for': 'python', 'do': 'pip3 install isort' }
Plug 'mindriot101/vim-yapf', {'for': 'python', 'do': 'pip3 install yapf'}
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'python-rope/ropevim', { 'for': 'python' }
Plug 'hdima/python-syntax', {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}

Plug 'tmhedberg/SimpylFold'


" HTML & CSS
Plug 'othree/html5.vim', {'for': ['jinja', 'jinja2', 'html', 'html5', 'djangohtml']}
Plug 'hail2u/vim-css3-syntax', {'for': ['jinja', 'jinja2', 'html', 'html5', 'djangohtml', 'css']}
Plug 'ap/vim-css-color', {'for': ['jinja', 'jinja2', 'html', 'html5', 'djangohtml', 'css']}


" RestructuredText & Markdown
Plug 'Rykka/riv.vim', { 'for': 'rst' }


" JavaScrip & JSON & YAML
Plug 'elzr/vim-json', {'for': 'json'}

" Syntax
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'marijnh/tern_for_vim', {'for': 'javascript', 'do': 'npm install'}

" Misc
" Plug 'tpope/vim-markdown'
Plug 'rizzatti/dash.vim'
Plug 'aklt/plantuml-syntax'
Plug 'szw/vim-tags'

call plug#end()
