syntax on "enable syntax highlighting

set number relativenumber
set nu rnu

set autoindent "next line inherits previous line indent 
set expandtab "tabs get formatted to spaces
set tabstop=4 "number of spaces per tab
set softtabstop=4 "number of spaces per tab when editing
set smarttab
set shiftround
set shiftwidth=4

set hlsearch "search highlighting
set incsearch "start searching when typing
set ignorecase "ignore case of search
set smartcase "switch to case sensitive search when there's a capital

set history=500

"set spell "spellcheck

set showcmd "show the command just executed

set showmatch "highlight matching [{()}]

""""""""""""remaps""""""""""""""
" move vertically by visual line
nnoremap j gj 
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" jf is escape
inoremap jf <esc>
