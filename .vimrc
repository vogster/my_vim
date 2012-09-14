if $TERM=="screen"
  set term=xterm
endif

map <F2> :NERDTreeToggle<CR>

syntax on
filetype plugin on
colorscheme anotherdark

set vb
set number
set autoindent 
set incsearch
set mouse=a
set ts=4
set so=8
set expandtab
set shiftwidth=4

" unused
" use visual bell instead of beeping
" syntax highlighting
" set bg=light
" colorscheme wombat
set encoding=utf8
" perl-support
au BufRead *.tx set filetype=xslate

if has ("autocmd")
    " File type detection. Indent based on filetype. Recommended.
    filetype plugin indent on
endif

set runtimepath^=~/.vim/ctrlp

command! -complete=shellcmd -nargs=+ RR call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    echo a:cmdline
    let expanded_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
            let expanded_part = fnameescape(expand(part))
            let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
        endif
    endfor
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1, 'Output of:    ' . a:cmdline)
"    call setline(2, 'Expanded Form:  ' .expanded_cmdline)
    call setline(2,substitute(getline(1),'.','=','g'))
    execute '$read !'. expanded_cmdline
    setlocal nomodifiable
    1
endfunction

let g:ctrlp_open_new_file = 'r'

nmap <C-w>q <Plug>Kwbd

set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set wildchar=<Tab> wildmenu wildmode=full

let mapleader = ","

map <Leader>a :bprev!<Return>
map <Leader>s :bnext!<Return>
map <Leader>l :CtrlPBuffer<Return>

