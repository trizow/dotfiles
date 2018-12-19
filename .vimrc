" --------- Setup  --------------------------------
set nocompatible
filetype plugin on       " may already be in your .vimrc
filetype plugin indent on

syntax on

au BufRead,BufNewFile *.manifest set filetype=json

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" set NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" --------- Plugged Plugins --------------------------------
call plug#begin('~/.vim/plugged')

" code completion
"Plug 'valloric/youcompleteme'
"
" Kotlin support
Plug 'udalov/kotlin-vim'

" Solarized
Plug 'altercation/vim-colors-solarized'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Tabline
Plug 'vim-airline/vim-airline'

" Plugin for git
Plug 'tpope/vim-fugitive'

" syntax checker
Plug 'scrooloose/syntastic'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'pprovost/vim-ps1'
Plug 'reedes/vim-lexical'

" Plugin for tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Markdown support
Plug 'mikewest/vim-markdown'

Plug 'christoomey/vim-tmux-navigator'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

" --------- Plugin configs  --------------------------------
"  Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_go_checkers = ['gometalinter']

augroup lexical
	autocmd!
	autocmd FileType markdown,mkd call lexical#init()
	autocmd FileType textile call lexical#init()
	autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END



" --------- Keys --------------------------------
"  These maps are for tmux window movement which matches NERDTree
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" This copies from the vim buffer to clipboard and vise versa
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

if &term == 'screen-256color'
	let g:tmux_navigator_no_mappings = 1
	nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
	nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
	nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
	nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
endif


