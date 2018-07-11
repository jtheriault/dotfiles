" Keep artifact files tidy
if has('persistent_undo')
    set undodir=~/.vim/undo//
endif
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Navigation
nnoremap <C-Tab> : bnext<CR>
nnoremap <S-C-Tab> : bprevious<CR>

" Visual: Theme
colorscheme desert "murphy darkblue desert

" Visual: Line numbers
set number
set cursorline

" Visual: Statusline
set laststatus=2        " always show statusline

set statusline=%n\
set statusline+=%F       " base of the filename
set statusline+=%m      " modified flag
set statusline+=%h      " help file flag
set statusline+=%r      " read only flag
set statusline+=%y      " filetype
set statusline+=%=      " left/right separator
set statusline+=%l:%c   " cursor line:column

" Visual: Search highlighting
set hlsearch  "think: highlighted search
map <silent> <Esc> :noh<CR>

" Visual: Syntax highlighting
autocmd BufReadPost *.html.js set syntax=html

" Editing: Save me from myself
if has('persistent_undo')
    set undofile
endif
set autowrite
set hidden
set confirm

" Editing: Automatically indent, and tabs are 4 spaces
set autoindent
set shiftwidth=4
set softtabstop=4
set expandtab

" Editing: Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e
noeol
nofixeol

" Editing: Omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete " All omnicomplete, all the time
inoremap <C-space> <C-x><C-o>

" File: Ignore certain paths
set wildignore+=*/.git/*,*/node_modules/*

" Plugins: Pathogen
execute pathogen#infect()

" Plugins: CtrlP
let g:ctrlp_by_filename = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 1
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:25'

" Plugins: NERDTree
map <C-n> :NERDTreeToggle <CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode=2
runtime ~/.vim/bundle/nerdtree-git-plugin/nerdtree_plugin/git_status.vim
"autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p " Refresh on writes

" Plugins: JsDoc
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_param_description_separator=' - '
