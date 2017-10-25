    "dein Scripts-----------------------------
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

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/deoplete.nvim')

    call dein#add('scrooloose/nerdtree',
    \{'on_cmd': 'NERDTreeToggle'})
    call dein#add('vim-airline/vim-airline')
    "  call dein#add('bps/vim-textobj-python', { 'on_ft' : 'python' }) 
    call dein#add('Raimondi/delimitMate', {'on_map' : { 'i' : ['(', '[', '{' ] }})
    
    " autocomplete
    call deoplete#enable()
    
    autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
    autocmd CompleteDone * pclose " To close preview window of deoplete automagically
    " You can specify revision/branch/tag.
    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    " Required:
    call dein#end()
    call dein#save_state()
    endif

    " Required:
    filetype plugin indent on
    syntax enable 

    " old vim stuff
    set tabstop=4       " number of visual spaces per TAB
    set shiftwidth=4 
    set expandtab       " tabs are spaces
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
    set mouse=a 
    " https://dougblack.io/words/a-good-vimrc.html
    " let g:hybrid_custom_term_colors = 1
    " let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
    colorscheme one 

    " copy and paste
    vmap <C-c> "+y
    vmap <C-x> "+c
    "vmap <C-v> c<ESC>"+p
    "imap <C-v> <ESC>"+pa
    
    " turn off search highlight
    nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

    " move vertically by visual line
    nnoremap j gj
    nnoremap k gk
    " execute pathogen#infect()

    " NERDTREE
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " If you want to install not installed plugins on startup.
    if dein#check_install()
    call dein#install()
    endif

    let g:python_host_prog = '/usr/bin/python'
    let g:python3_host_prog = '/usr/bin/python3'
