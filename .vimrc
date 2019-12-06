syntax on
set nowrap
set backspace=2
set shell=bash
set ls=2
set showmatch
set expandtab
set tabstop=4
"set shiftwidth=4
set softtabstop=4
"gigi

colorscheme desert
set smartcase " but do case sensitive if uppercase letters are submitted
set showmode " show the mode we're in

set nosol " try to stay in same column when jumping
set ignorecase
set ruler
filetype on
set autoindent

let g:loaded_matchparen=1
"set keywordprg=/web/php_doc
"let Tlist_Ctags_Cmd ='/usr/bin/ctags'

" Viminfo file
au BufNewFile,BufRead .viminfo,_viminfo         setf viminfo
an 50.100.400 &Syntax.TUV.Vim.Viminfo\ file :cal SetSyn("viminfo")<CR>
normal mz
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
" Only do this part when compiled with support for autocommands
if has("autocmd")
  
  autocmd FileType * set formatoptions-=rco

  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78

  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif

function! OpenPhpFunction (keyword)
    let proc_keyword = substitute(a:keyword , '_', '-', 'g')
    exe 'split'
    exe 'enew'
    exe "set buftype=nofile"
    exe 'silent r!lynx -dump -nolist http://www.php.net/manual/en/print/function.'.proc_keyword.'.php'
    exe 'norm gg'
    exe 'call search ("' . a:keyword .'")'
    exe 'norm dgg'
    exe 'call search("User Contributed Notes")'
    exe 'norm dGgg'
endfunction
au FileType php map K :call OpenPhpFunction('<C-r><C-w>')<CR>

