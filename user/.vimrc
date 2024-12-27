call plug#begin()
" Colorscheme gruvbox
Plug 'morhetz/gruvbox'

" File explorer
Plug 'preservim/nerdtree'

" Vim tab
Plug 'vim-airline/vim-airline'

" Find file
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Github copilot
Plug 'github/copilot.vim'

" Language server protocol for C++
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Show line number
set number

" Enable syntax highlighting
syntax on

" Set tab width to 4 spaces
set tabstop=4

" Set the number of spaces to use for each step of (auto)indent
set shiftwidth=4

" Use spaces instead of tabs
set expandtab

set switchbuf=useopen,usetab,newtab

" increases the width of the current window
nnoremap <C-Up> <C-w>>

" decreases the width of the current window
nnoremap <C-Down> <C-w><

" Map Ctrl + Right to move to the next tab
nnoremap <C-Right> :tabnext<CR>

" Map Ctrl + Left to move to the previous tab
nnoremap <C-Left> :tabprevious<CR>

" copy selected text in visual mode to the system clipboard
vnoremap <C-c> "+y

" show/hide code block by za (see :help foldmethod)
set foldmethod=syntax

" -----------------------------------------
"  gruvbox start
" -----------------------------------------
set background=dark
colorscheme gruvbox 
let g:gruvbox_contrast_dark = 'medium'

" -----------------------------------------
"  gruvbox end
" -----------------------------------------

" -----------------------------------------
" NERDTree start
" -----------------------------------------

" Show/Hide
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" F5 to sync opened file with nerdtree
nnoremap <F5> :NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd'.argv()[0] | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Enable line numbers in NERDTree
autocmd FileType nerdtree setlocal number

" -------------------------------------
"  NERDTree end
" -------------------------------------

" -------------------------------------
"  vim-airline start
" -------------------------------------
" Vim tab information
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

" -------------------------------------
"  vim-airline end
" -------------------------------------

" -------------------------------------
"  fzf start
" -------------------------------------
" Ctrl + P to search files (same as vscode)
nnoremap <C-p> :Files<Cr>

" -------------------------------------
"  fzf end
" -------------------------------------

" -------------------------------------
" coc.nvim start
" -------------------------------------

" Use F12 to go to definition
nmap <silent> <F12> <Plug>(coc-definition)

" Use Ctrl + F to go to references
nnoremap <silent> <C-F> <Plug>(coc-references)

" Use F4 to switch between source and header files
nnoremap <silent> <F4> :CocCommand clangd.switchSourceHeader<CR>

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" -------------------------------------
"  coc.nvim end
" -------------------------------------
