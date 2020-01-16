syntax on
filetype on
filetype plugin on
colorscheme desert
set nowrap
set backspace=2
set shell=bash
set ls=2
set showmatch
set expandtab
set tabstop=4
"set shiftwidth=4
set softtabstop=4
set smartcase " but do case sensitive if uppercase letters are submitted
set showmode " show the mode we're in
set nosol " try to stay in same column when jumping
set ignorecase
set ruler
set smartindent
set autoindent

let g:loaded_matchparen=1
"set keywordprg=/web/php_doc
"let Tlist_Ctags_Cmd ='/usr/bin/ctags'

" Only do this part when compiled with support for autocommands
if has("autocmd")

    " Viminfo file
    au BufNewFile,BufRead .viminfo,_viminfo         setf viminfo
    an 50.100.400 &Syntax.TUV.Vim.Viminfo\ file :cal SetSyn("viminfo")<CR>
    normal mz
    set viminfo='20,\"50    " read/write a .viminfo file, don't store more
  
    autocmd FileType * set formatoptions-=rco

    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78

    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif

    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    call plug#begin('~/.vim/plugged')
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'ianks/vim-tsx'
    call plug#end()


endif

filetype indent off
