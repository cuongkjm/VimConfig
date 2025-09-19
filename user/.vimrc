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

" C++ graphical debugging
Plug 'puremourning/vimspector'
call plug#end()

" Enable mouse support
set mouse=a

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

" Set the terminal type to xterm-256color for better color and key support.
" This was added to resolve issues with function keys (like F3) not being
" correctly interpreted by Vim in the Foot terminal.
set term=xterm-256color

set switchbuf=useopen,usetab,newtab

" increases the width of the current window
nnoremap <C-Up> <C-w>>

" decreases the width of the current window
nnoremap <C-Down> <C-w><

" Map Ctrl + Right to move to the next tab
nnoremap <C-Right> :tabnext<CR>

" Map Ctrl + Left to move to the previous tab
nnoremap <C-Left> :tabprevious<CR>

" Alt + n to move to the n tab (1-9)
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
tnoremap <A-1> <C-\><C-N>1gt
tnoremap <A-2> <C-\><C-N>2gt
tnoremap <A-3> <C-\><C-N>3gt
tnoremap <A-4> <C-\><C-N>4gt
tnoremap <A-5> <C-\><C-N>5gt
tnoremap <A-6> <C-\><C-N>6gt
tnoremap <A-7> <C-\><C-N>7gt
tnoremap <A-8> <C-\><C-N>8gt
tnoremap <A-9> <C-\><C-N>9gt
inoremap <A-1> <C-o>1gt
inoremap <A-2> <C-o>2gt
inoremap <A-3> <C-o>3gt
inoremap <A-4> <C-o>4gt
inoremap <A-5> <C-o>5gt
inoremap <A-6> <C-o>6gt
inoremap <A-7> <C-o>7gt
inoremap <A-8> <C-o>8gt
inoremap <A-9> <C-o>9gt
vnoremap <A-1> <C-c>1gt
vnoremap <A-2> <C-c>2gt
vnoremap <A-3> <C-c>3gt
vnoremap <A-4> <C-c>4gt
vnoremap <A-5> <C-c>5gt
vnoremap <A-6> <C-c>6gt
vnoremap <A-7> <C-c>7gt
vnoremap <A-8> <C-c>8gt
vnoremap <A-9> <C-c>9gt

" Map ct to close the current tab
nnoremap ct :tabclose<CR>

" copy selected text in visual mode to the system clipboard
vnoremap <C-c> "+y

" show/hide code block by za (see :help foldmethod)
set foldmethod=syntax
set foldlevel=99

" highlight search results
set hlsearch

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

" Show hidden files
let NERDTreeShowHidden=1

" F4 to sync opened file with nerdtree without focusing.
nnoremap <F4> :NERDTreeFind<CR>:wincmd p<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd'.argv()[0] | endif

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

" Ctrl + O to go back, Ctrl + I to go forward
" Use F12 to open definition in a new tab (move to the existing tab if it is already open)
nmap <silent> <F12> :call CocAction('jumpDefinition', 'tab drop')<CR>zz
nmap <silent> gd :call CocAction('jumpDefinition', 'tab drop')<CR>zz

" Use K to show documentation of symbol under cursor (like hover in vscode)
nmap <silent> K :call CocAction('doHover')<CR>

" Use Ctrl + F to go to references
nnoremap <silent> <C-F> <Plug>(coc-references)

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" use Alt + o to switch header and source file
nnoremap <silent> <A-o> :CocCommand clangd.switchSourceHeader<CR>

" -------------------------------------
"  coc.nvim end
" -------------------------------------

" -------------------------------------
" Vimspector start
" -------------------------------------

" F5 to continue debugging
nnoremap <F5> :call vimspector#Continue()<CR>

" Shift + F5 to stop debugging
nnoremap <S-F5> :call vimspector#Stop()<CR>

" F9 to toggle break point
nnoremap <F9> :call vimspector#ToggleBreakpoint()<CR>

" F10 to step over
nnoremap <F10> :call vimspector#StepOver()<CR>

" F11 to step into
nnoremap <F11> :call vimspector#StepInto()<CR>

" Shift + F11 to step out
nnoremap <S-F11> :call vimspector#StepOut()<CR>

" -------------------------------------
" Vimspector end
" -------------------------------------

