" Let supertab decide the default completion type
" let g:SuperTabDefaultCompletionType = "context"
"
" completion settings
set wildignore=*.o,*.so,*.obj,*.bak,*.exe,*.dll,*~
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=node_modules
set wildignore+=*/ipad/native/www/*
set wildignore+=*/ipad/native/CordovaLib/*
set wildignore+=*/ipad/native/WorklightSDK/*
set wildignore+=*/android/native/assets/www/*

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
