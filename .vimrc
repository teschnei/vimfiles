set exrc
set secure

set relativenumber
set number
colo dracula

syntax enable
if has ('gui_running')
	set guifont=Consolas:h9:cANSI
	set guioptions-=T
endif

"set runtimepath^=~\vimfiles\bundle\ctrlp.vim
execute pathogen#infect()
set cindent
set cinoptions={s,fs,:s,(0,Ws,j1,)200
set expandtab
set backspace=indent,eol,start
set wildignore+=*\\tmp\\*,*\\32\\*,*\\64\\*,*.swp,*.zip,*.exe,*.obj  " Windows
set tabstop=2
set shiftwidth=2
set hlsearch
set incsearch

nmap <leader>p :CtrlPBuffer<CR>
noremap i k
noremap j h
noremap k j
noremap h i

nmap <C-A-Left> :tabp<CR>
nmap <C-A-Right> :tabn<CR>


let g:syntastic_quiet_messages = {
    \ "!level":  "errors" }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:annoyme_with = {
  \ 'i': {'<BS>': [],
  \       '<Del>': []}
\}

" Workaround for annoying bug when parsing ruby syntax regexp...
  augroup RubyRegex
    au!
    au BufReadPre *.rb setlocal regexpengine=1
    au BufWinEnter *.rb setlocal regexpengine=0
  augroup END

" vim -b : edit binary using xxd-format!
  augroup Binary
    au!
    au BufReadPre  *.exe let &bin=1
    au BufReadPost *.exe if &bin | %!xxd
    au BufReadPost *.exe set ft=xxd | endif
    au BufWritePre *.exe if &bin | %!xxd -r
    au BufWritePre *.exe endif
    au BufWritePost *.exe if &bin | %!xxd
    au BufWritePost *.exe set nomod | endif
  augroup END
