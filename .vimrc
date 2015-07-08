" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
"-----------------------------------------------------------------------------
" Global Stuff
"-----------------------------------------------------------------------------
" 
" Keys...
" map <F2> to toggle NERDTree window
" map <F7> to run flake8 when in python code

" Some settings that need to be set before we declare our bundles
" no vi compatibility
set nocompatible

"set modelines=0

set encoding=utf-8
set termencoding=utf-8
set scrolloff=3
set scrolljump=5
set autoindent
set showcmd
set linespace=0
set winminheight=0
set wildmenu
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set autoread
set shell=bash
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set showmode                    " Display the current mode

set nospell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

" turn backup off
set nobackup
set nowritebackup
set noswapfile

"set backup
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set backupskip=/tmp/*,/private/tmp/*
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set writebackup

" write out the buffer on switching buffers
set autowrite

" set relativenumber
set undofile

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc


" os-specific configuration
"let s:os = system("uname")
"if s:os =~ "Darwin"
"    so ~/.vim/os/darwin.vim
"else
"    so ~/.vim/os/linux.vim
"endif

source ~/.vim/vundle.vim

filetype off

syntax on
set background=dark						" I use dark background
colorscheme zenburn

" GUI options (only in effect when running in a GUI).
if has("gui_running")
    set guifont=Liberation\ Mono\ for\ Powerline:h11
    " set guifont=Source\ Code\ Pro\ for\ Powerline:h12
    " set guifont=Meslo\ LG\ L\ for\ Powerline:h12

    " Set Gui Options
    set guioptions=a

    " Set up the gui cursor to look nice
    set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

    if has("gui_macvim")
        " Map Cmd+<n> to move to tab <n>.
        map <D-1> :tabn 1<CR>
        map <D-2> :tabn 2<CR>
        map <D-3> :tabn 3<CR>
        map <D-4> :tabn 4<CR>
        map <D-5> :tabn 5<CR>
        map <D-6> :tabn 6<CR>
        map <D-7> :tabn 7<CR>
        map <D-8> :tabn 8<CR>
        map <D-9> :tabn 9<CR>
        map! <D-1> <C-O>:tabn 1<CR>
        map! <D-2> <C-O>:tabn 2<CR>
        map! <D-3> <C-O>:tabn 3<CR>
        map! <D-4> <C-O>:tabn 4<CR>
        map! <D-5> <C-O>:tabn 5<CR>
        map! <D-6> <C-O>:tabn 6<CR>
        map! <D-7> <C-O>:tabn 7<CR>
        map! <D-8> <C-O>:tabn 8<CR>
        map! <D-9> <C-O>:tabn 9<CR>

        " Add MacVim shift-movement
        let macvim_hig_shift_movement = 1

        " A itzy-bitzy amount of transparency
        set transparency=4
        
        " Anti-aliasing is niiiice
        set antialias
    endif
else
    " Setup the scrollwheel action
    set mouse=a
    map <ScrollWheelUp> <C-Y>
    map <ScrollWheelDown> <C-E>
endif

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

set history=200
set undolevels=1000

" set the search scan to wrap lines
set wrapscan

" If you search for an all-lowercase string your search will
" be case-insensitive, but if one or more characters is 
" uppercase the search will be case-sensitive.
set ignorecase
set smartcase

" Highlight search...
set hlsearch
set incsearch
set showmatch       "briefly jump to other matching bracket

" makes j and k work the way you expect instead of working 
" in some archaic “movement by file line instead of 
" screen line” fashion.
nnoremap j gj
nnoremap k gk

" get rid of that stupid goddamned help key 
" that you will invaribly hit constantly while 
" aiming for escape
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"save on losing focus
au FocusLost * :wa

" System default for mappings is now the "," charater
let mapleader = ","


" The <leader><space> mapping makes it easy 
" to clear out a search by typing ,<space>. 
" This gets rid of the distracting highlighting 
" once I’ve found what I’m looking for.
nnoremap <leader><space> :noh<cr>

" Make the tab key match bracket pairs
" nnoremap <tab> %
" vnoremap <tab> %

" Make command line one line high
set ch=1

" line numbers...
" set nu

" Hide the mouse pointer while typing
set mousehide

" Allow the cursor to go in to "invalid" places
set virtualedit=block

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
set textwidth=120

" Automatically read a file that has changed on disk
set autoread

set grepprg=grep\ -nH\ $*

" Jump commands...
"map <F3> g
"map <F4> 

map <leader>j j
map <leader>k k
map <leader>h h
map <leader>l l

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm<CR>
map tt :tabnew<CR>

map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

set tabpagemax=15               " Only show 15 tabs

" automatically close autocompletition window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" save as sudo
ca w!! w !sudo tee "%"

" colors and settings of autocompletition
"highlight Pmenu ctermbg=4 guibg=LightGray
"highlight PmenuSel ctermbg=8 guibg=DarkGray guifg=Red
"highlight PmenuSbar ctermbg=7 guibg=DarkGray
"highlight PmenuThumb guibg=Black

hi Pmenu  guifg=#404040 guibg=#B8B8B8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE


highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
" highlight clear CursorLineNr    " Remove highlight color from current line number


" autoclose
inoremap ( ()<Left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

set wildignore=*.pyc,*~

" autocompletition of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest,full

"folding...
set foldenable
set foldmethod=indent
set foldlevel=10
set foldnestmax=10
nnoremap <space> za

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Shortcuts
" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

"buffers
set switchbuf=usetab

" save a session and open with vim -S
nnoremap <leader>s :mksession<CR>

" Use ag to search
nnoremap <leader>a :Ag 

" autocommands...
source ~/.vim/general/autocmds.vim

" Setup vundle configuration...
source ~/.vim/general/airline.vim
source ~/.vim/general/ctags.vim
source ~/.vim/general/ctrlp.vim
source ~/.vim/plugins/nerdtree.vim
source ~/.vim/general/complete.vim
source ~/.vim/general/search.vim
source ~/.vim/languages/markdown.vim
source ~/.vim/languages/python.vim
source ~/.vim/languages/rst.vim
source ~/.vim/languages/syntastic.vim
source ~/.vim/plugins/jedi.vim
source ~/.vim/plugins/dash.vim
source ~/.vim/plugins/gitgutter.vim
source ~/.vim/plugins/tagbar.vim
source ~/.vim/plugins/tasklist.vim
source ~/.vim/plugins/fugitive.vim
source ~/.vim/plugins/neocomplete.vim

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

if has('gui_running')
    if filereadable(expand("~/.gvimrc.local"))
        source ~/.gvimrc.local
    endif
endif
