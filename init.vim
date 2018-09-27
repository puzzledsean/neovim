
    " --------------------------------------------------------------------------------------------------------------------
    " Required dein scripts
    " https://github.com/Shougo/dein.vim
    " --------------------------------------------------------------------------------------------------------------------
    if &compatible
    set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=/Users/Sean/.config/nvim/dein/repos/github.com/Shougo/dein.vim

    " Required:
    if dein#load_state('/Users/Sean/.config/nvim/dein')
        call dein#begin('/Users/Sean/.config/nvim/dein')

    " Let dein manage dein
    " Required:
    call dein#add('/Users/Sean/.config/nvim/dein/repos/github.com/Shougo/dein.vim')


    " --------------------------------------------------------------------------------------------------------------------
    " Install Plugins 
    " --------------------------------------------------------------------------------------------------------------------
    call dein#add('Shougo/neosnippet.vim')                                                " snippets
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/deoplete.nvim')                                                 " autocomplete
    call dein#add('vim-airline/vim-airline')                                              " vim airline
    call dein#add('Raimondi/delimitMate', {'on_map' : { 'i' : ['(', '[', '{' ] }})        " close parentheses and such
    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })                                 " specify revision/branch/tag
    call dein#add('fatih/vim-go')                                                         " add go 
    call dein#add('w0rp/ale')                                                             " add linter 
    call dein#add('pangloss/vim-javascript')

    " colors
    call dein#add('sheerun/vim-polyglot')
    call dein#add('joshdick/onedark.vim')

    " nerdtree
    call dein#add('joshdick/onedark.vim')
    call dein#add('scrooloose/nerdtree',{'on_cmd': 'NERDTreeToggle'})                     " NERDTree
    call dein#add('scrooloose/nerdcommenter')                                             " NERDCommenter
    call dein#add('Xuyuanp/nerdtree-git-plugin')

    "  call dein#add('bps/vim-textobj-python', { 'on_ft' : 'python'})

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
    let g:python3_host_prog = '/usr/local/bin/python3'
    let g:python_host_prog = '/usr/bin/python'

    filetype plugin indent on " enable loading indent file for filetype
    set tabstop=4           " number of visual spaces per TAB
    set shiftwidth=4
    set expandtab           " tabs are spaces
    set smarttab
    set number              " show line numbers
    set showcmd             " show command in bottom bar
    set cursorline          " highlight current line
    filetype indent on      " load filetype-specific indent files
    set wildmenu            " visual autocomplete for command menu
    set wildmode=full       " <Tab> cycles between all matching choices.
    set lazyredraw          " redraw only when we need to.
    set showmatch           " highlight matching [{()}]
    set incsearch           " search as characters are entered
    set hlsearch            " highlight matches
    set mouse=a             " use mouse 
    set list                " show trailing whitespace
    set listchars=tab:▸\ ,trail:▫
    set ignorecase
    
    " set colorcolumn=80    " draws a vertical line at column 80 
    " set tw=70               " text/line wrapping

    " --------------------------------------------------------------------------------------------------------------------
    " Keyboard shortcuts
    " --------------------------------------------------------------------------------------------------------------------
    let mapleader = ','

    " copy and paste to clipboard
    vmap <C-c> "+y 
    vmap <C-x> "+c

    " turn off search highlight.
    nnoremap <leader>s :noh<CR> 

    " Show/hide NERDTree.
    nnoremap <leader>d :NERDTreeToggle<CR>
    " Fix lint errors.
    nnoremap <leader>l :ALEFix<CR> <bar> :sleep 500m <CR> <bar> :%s/\r//g <CR>

    nnoremap <leader>f :NERDTreeFind<CR>

    " navigation
    map <S-h> ^
    map <S-l> $

    " navigation between buffers
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l

    " Tab and Shift+Tab to indent/unindent
    map <S-Tab> <<
    map <Tab> >> 

    " unmap keys
    map J <nop>
    map K <nop>

    " --------------------------------------------------------------------------------------------------------------------
    " Vim Javascript
    " --------------------------------------------------------------------------------------------------------------------
    " Indent for Javascript is only 2 indents instead of 4.
    autocmd filetype javascript set sw=2 ts=2 expandtab


    " --------------------------------------------------------------------------------------------------------------------
    " Colors / Airline 
    " --------------------------------------------------------------------------------------------------------------------
    " https://dougblack.io/words/a-good-vimrc.html
    let g:hybrid_custom_term_colors = 1
    let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.

    "Credit joshdick
    "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
    "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
    "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
    if (empty($TMUX))
      if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
      endif
      "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
      "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
      " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
      if (has("termguicolors"))
        set termguicolors
      endif
    endif

    colorscheme onedark

    " set background=light" for the dark version
    " colorscheme one
    " let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    " let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    " syntax on


    " airline
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
    let g:ale_set_highlights = 0

    let g:ale_linters = {
    \   'python': ['pycodestyle'],
    \   'javascript': ['eslint'],
    \}
    let g:ale_fixers = {
    \   'python': ['yapf', 'isort'],
    \   'javascript': ['eslint'],
    \}

    " --------------------------------------------------------------------------------------------------------------------
    " NERDTree 
    " --------------------------------------------------------------------------------------------------------------------
    " close NERDTree if it's the last buffer open
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

