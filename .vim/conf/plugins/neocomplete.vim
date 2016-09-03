if isdirectory(expand("~/.vim/bundle/neocomplete"))
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3

    let g:neocomplete#enable_auto_delimiter = 1
    let g:neocomplete#enable_fuzzy_completion = 1
    let g:neocomplete_enable_fuzzy_completion_start_length = 2
    let g:neocomplete#max_list = 10
    let g:neocomplete#force_overwrite_completefunc = 1
    let g:neocomplete#enable_auto_select = 0
    let g:neocomplete_enable_camel_case_completion = 0

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " These two lines conflict with the default digraph mapping of <C-K>
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)

    " <C-k> Complete Snippet
    " <C-k> Jump to next snippet point
    imap <silent><expr><C-k> neosnippet#expandable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
    smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

    inoremap <expr><C-g> neocomplete#undo_completion()
    "inoremap <expr><C-l> neocomplete#complete_common_string()
    inoremap <expr><CR> neocomplete#complete_common_string()

    " <CR>: close popup
    " <s-CR>: close popup and save indent.
    inoremap <expr><s-CR> pumvisible() ? neocomplete#smart_close_popup()."\<CR>" : "\<CR>"

    function! CleverCr()
        if pumvisible()
            if neosnippet#expandable()
                let exp = "\<Plug>(neosnippet_expand)"
                return exp . neocomplete#smart_close_popup()
            else
                return neocomplete#smart_close_popup()
            endif
        else
            return "\<CR>"
        endif
    endfunction

    " <CR> close popup and save indent or expand snippet
    imap <expr> <CR> CleverCr()
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplete#smart_close_popup()

    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

    " Courtesy of Matteo Cavalleri
    function! CleverTab()
        if pumvisible()
            return "\<C-n>"
        endif
        let substr = strpart(getline('.'), 0, col('.') - 1)
        let substr = matchstr(substr, '[^ \t]*$')
        if strlen(substr) == 0
            " nothing to match on empty string
            return "\<Tab>"
        else
            " existing text matching
            if neosnippet#expandable_or_jumpable()
                return "\<Plug>(neosnippet_expand_or_jump)"
            else
                return neocomplete#start_manual_complete()
            endif
        endif
    endfunction

    imap <expr> <Tab> CleverTab()

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
endif
