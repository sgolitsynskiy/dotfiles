" .vimrc
" Author  : Sergey Golitsynskiy <sgolitsynskiy@gmail.com>
" License : MIT

if !exists("g:syntax_on")
    syntax enable
endif

filetype plugin on
filetype indent on


let mapleader = ","      " set Leader
let maplocalleader = "," " set LocalLeader

let g:netrw_banner = 0  " do not display title banner in file explorer


" Settings {{{1
set nocompatible    " no need for old Vi
set autoread        " set to auto read when file is changed from the outside
set ignorecase      " search case-insensitive
set smartcase       " do not ignore case if pattern contains uppercase letter
set hlsearch        " highlight search matches
set number          " line numbers
set autoindent      " use current indent on new line
set smartindent
set pastetoggle=<F2>    " paste mode on/off
set display+=lastline 	" display incomplete last line (not @@@)
set history=1000    "history == good
set listchars=tab:\ \ ,trail:·     " display tabs and trailing spaces
set nolist          " toggle to display: if on, typing is annoying
set nowrap          " do not wrap lines
set scrolloff=3     " more context around cursor
set formatlistpat+=\\\|^\\*\\s*   " prevent reformatting of * bullets
 
set expandtab       " use spaces instead of tabs in I mode
set tabstop=4       " spaces in a tab
set shiftwidth=4    " spaces in a tab when autoindenting
set softtabstop=4   " spaces in a tab in I mode

set splitbelow      " on H split open new window below
set splitright      " on V split open new window to the right

set nobackup        " no backup files
set nowritebackup   " no backup files
set noswapfile      " no swap files

" better file/command completion
set wildmenu
set wildmode=list:longest

"helps when maximizing other splits
set winminwidth=0   
set winminheight=0
"
" Mappings {{{1
" switch to N mode
inoremap jk <Esc>

" use single quote (or back tick) to go back to mark
nnoremap ' `

" yank to end of line
nnoremap Y y$

" home + end
nnoremap H ^
nnoremap L $

" move to end of line before joining 
nnoremap J $J

" hit enter to clear last search pattern
nnoremap <silent> <CR> :let @/ = ""<CR>

" open .vimrc in vsplit
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

" source .vimrc
noremap <Leader>sv :source $MYVIMRC<CR>

" split navigation: Use ctrl-[hjkl] to select split
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" split resizing
nnoremap <silent> <C-Right> :vertical res +1<CR>
nnoremap <silent> <C-Left>  :vertical res -1<CR>
nnoremap <silent> <C-Up>    :res +1<CR>
nnoremap <silent> <C-Down>  :res -1<CR>

" add semicolumn at end of line without moving cursor
nnoremap <Leader>; mqA;<esc>`q

" faster scrolling up/down (2 lines instead of 1)
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" toggle list option / dispalys trailing space/tabs
nnoremap <silent> <leader>s :set nolist!<CR>

" toggle spell check
nnoremap <leader>ss :setlocal spell!<CR>

" because no self-discipline
nnoremap <Left> :echoe "must use h"<CR>
nnoremap <Right> :echoe "must use l"<CR>
nnoremap <Up> :echoe "must use k"<CR>
nnoremap <Down> :echoe "must use j"<CR>
nnoremap <PageUp> :echoe "must use CTRL-b"<CR>
nnoremap <PageDown> :echoe "must use CTRL-f"<CR>
nnoremap <Home> :echoe "must use 0"<CR>
nnoremap <End> :echoe "must use $"<CR>

"reindent file, then go back to where you were
nnoremap <F7> mqgg=G`q
" }}}1

" Autocommands {{{1
augroup my_filetypedetect 
    autocmd!
    " au BufNewFile,BufRead *.html setf xml  " until I find a better syntax file (but still not sure)
    au BufNewFile,BufRead *.wsgi set filetype=python
    au BufRead,BufNewFile gitconfig set filetype=gitconfig
    au BufNewFile,BufRead *.ejs set filetype=html
augroup END

augroup insert_comment
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType java nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType php nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
augroup END

augroup misc_settings
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType sh setlocal ts=2 sw=2 sts=2 noexpandtab
    autocmd FileType html,markdown,liquid setlocal tw=100
    autocmd FileType html,xml,css,scss,javascript,json,typescript,pug,yaml,markdown,liquid,ruby setlocal ts=2 sw=2 sts=2 
    autocmd FileType python setlocal foldmethod=indent | nnoremap <space> zA
    autocmd FileType python normal! zR
augroup END
" }}}1
