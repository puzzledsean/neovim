    
    " --------------------------------------------------------------------------------------------------------------------
    " Required dein scripts
    " https://github.com/Shougo/dein.vim
    " --------------------------------------------------------------------------------------------------------------------
    if &compatible
    set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=/Users/Sean/.random/repos/github.com/Shougo/dein.vim

    " Required:
    if dein#load_state('/Users/Sean/.random')
    call dein#begin('/Users/Sean/.random')

    " Let dein manage dein
    " Required:
    call dein#add('/Users/Sean/.random/repos/github.com/Shougo/dein.vim')
    
    
    " --------------------------------------------------------------------------------------------------------------------
    " Install Plugins 
    " --------------------------------------------------------------------------------------------------------------------
    call dein#add('Shougo/neosnippet.vim')                                                " snippets
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/deoplete.nvim')                                                 " autocomplete
    call dein#add('scrooloose/nerdtree',{'on_cmd': 'NERDTreeToggle'})                     " NERDTree
    call dein#add('scrooloose/nerdcommenter')                                             " NERDCommenter
    call dein#add('vim-airline/vim-airline')                                              " vim airline
    call dein#add('Raimondi/delimitMate', {'on_map' : { 'i' : ['(', '[', '{' ] }})        " close parentheses and such
    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })                                 " specify revision/branch/tag
 
    "  call dein#add('bps/vim-textobj-python', { 'on_ft' : 'python' }) 
    
    " If you want to install not installed plugins on startup.
    if dein#check_install()
    call dein#install()
    endif
   
    " Required:
    call dein#end()
    call dein#save_state()
    endif


    " --------------------------------------------------------------------------------------------------------------------
    " Deoplete 
    " --------------------------------------------------------------------------------------------------------------------
    " autocomplete
    call deoplete#enable()
    " disable deoplete preview
    set completeopt-=preview
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1

    " use tab to forward cycle
    inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    " use shift tab to backward cycle
    inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<S-tab>"

    " show snippets with short names
    call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
    nnoremap <F9> :call deoplete#toggle()<CR> 
    autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
    autocmd CompleteDone * pclose " To close preview window of deoplete automagically


    " --------------------------------------------------------------------------------------------------------------------
    " Vim config stuff 
    " --------------------------------------------------------------------------------------------------------------------
    " set python interpreter
    let g:python3_host_prog = '/usr/bin/python3'
    let g:python_host_prog = '/usr/bin/python'
    
    filetype plugin indent on
    syntax enable 
    set tabstop=4           " number of visual spaces per TAB
    set shiftwidth=4 
    set expandtab           " tabs are spaces
    set smarttab
    set number              " show line numbers
    set showcmd             " show command in bottom bar
    set cursorline          " highlight current line
    filetype indent on      " load filetype-specific indent files
    set wildmenu            " visual autocomplete for command menu
    set lazyredraw          " redraw only when we need to.
    set showmatch           " highlight matching [{()}]
    set incsearch           " search as characters are entered
    set hlsearch            " highlight matches
    set mouse=a             " use mouse 
    vmap <C-c> "+y          " copy and paste  
    vmap <C-x> "+c
    nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR> " turn off search highlight
    let g:netrw_dirhistmax = 0
    
    
    " --------------------------------------------------------------------------------------------------------------------
    " Colors 
    " --------------------------------------------------------------------------------------------------------------------
    " https://dougblack.io/words/a-good-vimrc.html
    let g:hybrid_custom_term_colors = 1
    let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
    colorscheme one 
    let g:airline#extensions#branch#enabled=1
    let g:airline#extensions#hunks#enabled=0

    
    " --------------------------------------------------------------------------------------------------------------------
    " ALE linter 
    " --------------------------------------------------------------------------------------------------------------------
    nmap <silent> <C-k> <Plug>(ale_previous_wrap)       " navigate between errors quickly 
    nmap <silent> <C-j> <Plug>(ale_next_wrap) 
    let g:ale_echo_msg_error_str = 'E'                  " customomized error message formatting
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


    " --------------------------------------------------------------------------------------------------------------------
    " NERDTree 
    " --------------------------------------------------------------------------------------------------------------------
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " --------------------------------------------------------------------------------------------------------------------
    " NERDCommenter
    " --------------------------------------------------------------------------------------------------------------------
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1 

