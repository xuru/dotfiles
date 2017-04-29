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

" General
Plug 'editorconfig/editorconfig-vim'
if executable('ag')
    Plug 'mileszs/ack.vim'
    let g:ackprg = 'ag --vimgrep'
elseif executable('ack')
    Plug 'mileszs/ack.vim'
endif

" Plug 'tpope/vim-sensible'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tyok/nerdtree-ack'

if executable('ctags')
    Plug 'majutsushi/tagbar'
endif

" Plug 'haya14busa/incsearch.vim'
" Plug 'amix/open_file_under_cursor.vim'

Plug 'itchyny/landscape.vim'
Plug 'itchyny/lightline.vim'

" library for other bundles to support repeat '.' (surrond, abolish)
" Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'ctrlpvim/ctrlp.vim'

" Plug 'powerline/fonts'
Plug 'jnurmine/Zenburn'
Plug 'flazz/vim-colorschemes'             " Colorschemes

" General Programming
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/syntastic'

" Snippets & AutoComplete
" Plug 'Valloric/YouCompleteMe', { 'do': '/usr/local/bin/python3 ./install.py --clang-completer'  }
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Python
Plug 'davidhalter/jedi-vim', { 'do': 'pip install jedi' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
" Plug 'fisadev/vim-isort', { 'for': 'python', 'do': 'pip3 install isort' }
" Plug 'mindriot101/vim-yapf', {'for': 'python', 'do': 'pip3 install yapf'}
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" Plug 'python-rope/ropevim', { 'for': 'python' }
Plug 'hdima/python-syntax', {'for': 'python'}

" Plug 'tmhedberg/SimpylFold'

" HTML & CSS
" Plug 'othree/html5.vim', {'for': ['jinja', 'jinja2', 'html', 'html5', 'djangohtml']}
" Plug 'hail2u/vim-css3-syntax', {'for': ['jinja', 'jinja2', 'html', 'html5', 'djangohtml', 'css']}
" Plug 'ap/vim-css-color', {'for': ['jinja', 'jinja2', 'html', 'html5', 'djangohtml', 'css']}

" RestructuredText & Markdown
Plug 'Rykka/riv.vim', { 'for': 'rst' }

" JavaScrip & JSON & YAML
" Plug 'elzr/vim-json', {'for': 'json'}

" Syntax
" Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
" Plug 'pangloss/vim-javascript', {'for': 'javascript'}
" Plug 'mxw/vim-jsx', {'for': 'javascript'}
" Plug 'marijnh/tern_for_vim', {'for': 'javascript', 'do': 'npm install'}

" Misc
Plug 'tpope/vim-markdown'
Plug 'rizzatti/dash.vim'

call plug#end()
