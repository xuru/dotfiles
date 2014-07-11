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
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set autoread

" turn backup off
set nobackup
set nowritebackup
set noswapfile

" if we're running in the fish shell, tell vim to fire up a different shell for
" compiles, etc..
if &shell =~# 'fish$'
    set shell=sh
endif

" write out the buffer on switching buffers
set autowrite

" set relativenumber
set undofile

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

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

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent
set shiftround      "round to multiples of shiftwidth
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
nnoremap <tab> %
vnoremap <tab> %


" Make command line one line high
set ch=1

" Set the status line the way i like it
set statusline=%f\ %m\ %r\ %{VCSCommandGetStatusLine()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" line numbers...
" set nu

" Hide the mouse pointer while typing
set mousehide

" Allow the cursor to go in to "invalid" places
set virtualedit=block

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
set textwidth=80

" Add the unnamed register to the clipboard
"set clipboard+=unnamed

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

nmap <leader>a <ESC>:Ack!

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm<CR>
map tt :tabnew
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>
" show pending tasks list
map <F2> :TaskList<CR>

" automatically close autocompletition window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" removes trailing spaces of python files
" (and restores cursor position)
autocmd BufWritePre *.py mark z | %s/ *$//e | 'z

" save as sudo
ca w!! w !sudo tee "%"

" colors and settings of autocompletition
highlight Pmenu ctermbg=4 guibg=LightGray

" highlight PmenuSel ctermbg=8 guibg=DarkBlue guifg=Red
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black

" simple recursive grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
nmap ,R :RecurGrep
nmap ,r :RecurGrepFast
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>

" autoclose (
inoremap ( ()<Left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

set wildignore=*.pyc,*~

" autocompletition of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

"folding...
set foldmethod=indent
set foldlevel=99
set foldenable

"buffers
set switchbuf=usetab

" autocommands...
source ~/.vim/autocmds.vim

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d syntax=%s :",
        \ &tabstop, &shiftwidth, &textwidth, &filetype)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(0, l:modeline)
endfunction

" Setup vundle configuration...
source ~/.vim/powerline.vim
source ~/.vim/vcscommand.vim
source ~/.vim/python.vim
source ~/.vim/ctrlp.vim
source ~/.vim/nerdtree.vim
"source ~/.vim/chef.vim
source ~/.vim/markdown.vim
source ~/.vim/rst.vim
source ~/.vim/tagbar.vim
source ~/.vim/dash.vim

nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
