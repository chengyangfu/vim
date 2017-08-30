" Cheng-Yang Fu's vimrc"
" e-mail = <chengyangfu@gmail.com>, <cyfu@cs.unc.edu>

"Seting for Vundle 
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
" Check PEP8 style
Plugin 'nvie/vim-flake8'
" Colors
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" NERDTree:used to navigate the files
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" supoort git operations
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Support PEP8 style for python files
au BufNewFile,BufRead *.py 
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Support PEP8 style for (web files)
au BufNewFile,BufRead *.js,*.html,*.css
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2

" Support utf-8 encoding
set encoding=utf-8

" Set YouCompleteMe 
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Change the color for python files
let python_highlight_all=1
syntax on

" Change color scheme
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" Hide *.pyc in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" show line number
set nu
