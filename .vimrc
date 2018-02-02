set nocompatible	" vim > vi; got to be first

" configure vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim	" set runtime path to Vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'	" let Vundle manage Vundle

" -- color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

Plugin 'vim-airline/vim-airline'	" fancy statusbar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'	" project tree browser
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'	" syntax

call vundle#end()            " Vundle plugins go above
filetype plugin indent on    " turn on indent for plugin files

" general
set backspace=indent,eol,start	" normal backspace supposedly
set ruler	" show line/column number
set number	" show line numbers in left gutter
set showcmd	" show partial commands
set incsearch	" highlight searches as typed
set hlsearch	" highlight results for prev search; clear w/ :nohlsearch (or :noh)
syntax on	" enable syntax highlighting with defaults
set mouse=a	" enable mouse in all four modes (i'm not sure i want this frankly)
highlight clear SignColumn	" clear highlight for plugins that put symbols in sign column (like syntastic)

au FileType gitcommit set tw=72 | set spell  

" plugin settings

" -- altercation/vim-colors-solarized
set background=dark
colorscheme solarized

" -- vim-airline/vim-airline
set laststatus=2	" always show statusbar
" let g:airline_powerline_fonts=1	" use patched fonts
let g:airline_detect_paste=1	" show paste mode
let g:airline#extensions#tabling#enabled=1	"show tabs too
let g:airline_theme='solarized'

" -- jist/vim-nerdtree-tabs
nmap <silent> <Leader>t :NERDTreeTabsToggle<CR>	" \t == open/close NERDTree Tabs
" let g:nerdtree_tabs_open_on_console_startup=1

" -- scrooloose/syntastic
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#syntastic#error_symbol='𝒙'
let g:airline#extensions#syntastic#warning_symbol='▲'
augroup mySyntastic	" define group
  " remove all commands for group first; best practice
  au!
  au FileType tex let b:syntastic_mode='passive'	" turn auto syntax for LaTeX files; not sure I need this
augroup END

