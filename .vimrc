"----------------------------------------------------------"
" Author:       Tim S�ter�y - timsateroy@gmail.com         "
" Date:         26.08.12                                   "
" Colorscheme:  Jellybeans                                 "
" Plugins:      AutoClose, Ctrlp, Fugitive, MRU,           "
"               Nerdtree, Pastie, Powerline, Snipmate,     "
"               Supertab, Surround, Vundle                 "
" Updated:      http://vim.thevoid.no                      "
"----------------------------------------------------------"

""" Vundle plugin manager {{{
    filetype off                                    " required to init 
    set rtp+=~/.vim/bundle/vundle/                  " include vundle
    call vundle#rc()                                " init vundle
    """ github repos {{{
        Bundle 'gmarik/vundle'
        Bundle 'ervandew/supertab'
        Bundle 'kien/ctrlp.vim'
        Bundle 'Lokaltog/vim-powerline'
"        Bundle 'msanders/snipmate.vim'
        Bundle 'scrooloose/nerdtree'
"        Bundle 'townk/vim-autoclose'
"        Bundle 'tpope/vim-fugitive'
"        Bundle 'tpope/vim-surround'
"        Bundle 'tpope/vim-pastie'
"        Bundle 'vim-scripts/mru.vim'
""" }}}
""" User interface {{{
    """ Syntax highlighting {{{
        filetype plugin indent on                   " enable ft+plugin detect
        syntax on                                   " syntax highlighting
        set t_Co=256                                " 256-colors
        set background=dark                         " we're using a dark bg
        colors jellybeans                          " select colorscheme
        highlight Normal ctermbg=NONE               " use terminal background
        highlight nonText ctermbg=NONE              " use terminal background
        au BufRead,BufNewFile *.txt set ft=sh       " opens .txt w/highlight
        """ Highlight characters past 80 {{{
            augroup vimrc_autocmds
                autocmd BufEnter * highlight OverLength ctermbg=black guibg=#212121
                autocmd BufEnter * match OverLength /\%80v.*/
            augroup END
        """ }}}
    """ }}}
    """ Interface general {{{
        set encoding=utf-8                          " For Powerline glyphs
        set more                                    " ---more--- like less
        set noshowmode                              " hide mode in cmd-line
        set number                                  " line numbers
        set showcmd                                 " show cmds being typed
        set title                                   " window title
        set visualbell                              " visual instead of beep
        set wildignore=.bak,.pyc,.o,.ojb,.,a,       " ignore said files
                       \.pdf,.jpg,.gif,.png,
                       \.avi,.mkv,.so
        set wildmenu                                " better cmd-completion
        set wildmode=list:longest                   " wildmode huge list
        """ Gvim {{{
            set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 8
            set guioptions-=m                       " remove menubar
            set guioptions-=T                       " remove toolbar
            set guioptions-=r                       " remove right scrollbar
        """ }}}
        """ Powerline {{{
        """    let g:Powerline_symbols = 'fancy'       " glyphs, require fontpatch
        """ }}}
    """ }}}
""" }}}
""" General settings {{{
    set hidden                                      " buffer change, more undo
    set history=200                                 " default 20
    set iskeyword+=_,$,@,%,#                        " not word dividers
    set laststatus=2                                " always show statusline
    set listchars=tab:>\                            " > to highlight <tab>>
    set list                                        " displaying listchars
    set mouse=a                                     " mouse in all modes
    set nocompatible                                " don't vi-compatible
    set noexrc                                      " don't use other .*rc(s)
    set nostartofline                               " no goto #1 char in line
    set nowrap                                      " don't wrap lines
    set numberwidth=5                               " 99999 lines
    """ Folding {{{
        set foldcolumn=1                            " 1 width folding column
        set foldmethod=indent                       " folds using indent
        set foldnestmax=10                          " max 10 nested folds
        set nofoldenable                            " all folds open default
    """ }}}
    """ Search and replace {{{
        set gdefault                                " default s//g (global)
        set incsearch                               " "live"-search
        set ignorecase                              " case insensitive search
    """ }}}
    """ Matching {{{
        set matchtime=2                             " time to blink match {}
        set showmatch                               " tmp-jump to match-bracket
    """ }}}
""" }}}
""" Files {{{
    set autochdir                                   " always use curr. dir.
    set autoread                                    " refresh if changed
    set backup                                      " backup curr file
    set backupdir=~/.vim/backup,/tmp                " backup director{y,ies}
    set backupext=~                                 " append ~ to backups
    set confirm                                     " confirm changed files
    set noautowrite                                 " never autowrite
    set updatecount=50                              " update swp after 50chars
    set undolevels=1000                             " max undo's
""" }}}
""" Text formatting {{{
    set autoindent                                  " preserve indentation
    set backspace=indent,eol,start                  " smart backspace
    set expandtab                                   " no real tabs
    set shiftround                                  " be clever with tabs
    set shiftwidth=4                                " default 8
    set smartcase                                   " igncase,except w/capitals
    set smartindent                                 " see autoindent
    set smarttab                                    " tab to 0,4,8 etc.
    set softtabstop=4                               " "tab" feels like <tab>
    set tabstop=4                                   " replace <TAB> w/4 spaces
""" }}}
""" Keybindings {{{
    " Remap <leader>
    let mapleader=","

    " Open the plugin NERDTree
    noremap <F2> :NERDTreeToggle<CR>

    " Snipmate remapping
    imap <tab> <C-r>=TriggerSnippet()<CR>

    " Quickly edit/source .vimrc
    noremap <leader>ce :edit ~/.vimrc<CR>
    noremap <leader>cs :source ~/.vimrc<CR>

    " Toggle text wrapping
    nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR> 

    " Yank(copy) to system clipboard
    noremap <leader>y "+y
    noremap <leader>cs :source ~/.vimrc<CR>

    " Commenting with # or remove for multiple languages
    vnoremap <leader>; :s/^/#/<CR>:noh<CR>
    vnoremap <leader>: :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>"]
    
    """ Folding {{{
        nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
        vnoremap <Space> zf
    """ }}}
    """ Bubbling (bracket matching) {{{
        nmap <C-up> [e
        nmap <C-down> ]e
        vmap <C-up> [egv
        vmap <C-down> ]egv
    """ }}}
    """ Pasting {{{
        set pastetoggle=<F3>
        nnoremap p ]p
        nnoremap <C-p> p

    """ CtrlP
        map <leader>l :CtrlPBuffer<CR>
        map <leader>; :CtrlPMRUFiles<CR>
        map <leader>' :CtrlP<CR>

""" }}}



""" My changes
let perl_fold = 1

function GetPerlFold()
  if getline(v:lnum) =~ '^\s*sub\s'
    return ">1"
  elseif getline(v:lnum) =~ '\}\s*$'
    let my_perlnum = v:lnum
    let my_perlmax = line("$")
    while (1)
      let my_perlnum = my_perlnum + 1
      if my_perlnum > my_perlmax
        return "<1"
      endif
      let my_perldata = getline(my_perlnum)
      if my_perldata =~ '^\s*\(\#.*\)\?$'
        " do nothing
      elseif my_perldata =~ '^\s*sub\s'
        return "<1"
      else
        return "="
      endif
    endwhile
  else
    return "="
  endif
endfunction
setlocal foldexpr=GetPerlFold()
setlocal foldmethod=expr


