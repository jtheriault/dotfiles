" Keep artifact files tidy
if has('persistent_undo')
    set undodir=~/.vim/undo//
endif
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Navigation
nnoremap <C-Tab> : bnext<CR>
nnoremap <S-C-Tab> : bprevious<CR>

" GUI: use mouse in "all" modes
set mouse=a

" GUI: no toolbar
set guioptions -=T

" Visual: Theme
colorscheme sorbet "increasing contrast: habamax sorbet evening koehler

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

" Editing: Set split and vsplit preferences
set splitright
set splitbelow

" File: Ignore certain paths
set wildignore+=*/.git/*,*/node_modules/*

" Allow local directory overrides
set exrc

" Plugins: vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Editing
Plug 'editorconfig/editorconfig-vim'
Plug 'schickling/vim-bufonly'
Plug 'wellle/context.vim'
Plug 'github/copilot.vim' " Run :Copilot setup

" Navigation
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'

" Syntax
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} | Plug 'neoclide/coc-tsserver' | Plug 'neoclide/coc-html' | Plug 'neoclide/coc-css' | Plug 'neoclide/coc-json' | Plug 'neoclide/coc-python' | Plug 'neoclide/coc-rls' " brew install watchman

" Snippets
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" Plugins: Copilot
let g:copilot_workspace_folders = ['~/Code']

" Plugins: NERDTree
map <C-n> :NERDTreeToggle <CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode = 2
runtime ~/.vim/bundle/nerdtree-git-plugin/nerdtree_plugin/git_status.vim
"autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p " Refresh on writes

" Plugins: CtrlP
let g:ctrlp_by_filename = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 1
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:25'

" Plugins: Syntastic
let g:syntastic_css_checkers = ["stylelint"]                " npm i -g stylelint
let g:syntastic_dockerfile_checkers = ["dockerfile_lint"]   " npm i -g dockerfile_lint
let g:syntastic_javascript_checkers = ["eslint"]            " npm i -g eslint
let g:syntastic_json_checkers = ["eslint"]                  " npm i -g eslint
let g:syntastic_python_checkers = ["python"]
let g:syntastic_sass_checkers = ["stylelint"]
let g:syntastic_sh_checkers = ["shellcheck"]                " apt-get install shellcheck || brew install shellcheck
let g:syntastic_yaml_checkers = ["jsyaml"]

" Plugins: JSDoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_param_description_separator = '-'
let g:jsdoc_enable_es6 = 1
nmap <silent> <C-l> <Plug>(jsdoc)

" Plugins: CoC
inoremap <silent><expr> <c-space> coc#refresh()

" Plugins: UltiSnips
" Ref: https://bhupesh.me/learn-how-to-use-code-snippets-vim-cowboy/
let g:UltiSnipsExpandTrigger="<c-enter>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/.vim/my-snippets']

