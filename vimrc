call plug#begin('~/.vim/plugged')
	Plug 'dense-analysis/ale'
	Plug 'altercation/vim-colors-solarized'
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'majutsushi/tagbar'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'posva/vim-vue'
	Plug 'isRuslan/vim-es6'
	Plug 'kchmck/vim-coffee-script'
	Plug 'jayli/vim-easycomplete'
	Plug 'ervandew/supertab'
	Plug 'severin-lemaignan/vim-minimap'
	Plug 'dgryski/vim-godef'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'vim-autoformat/vim-autoformat'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
	Plug 'tikhomirov/vim-glsl'
	Plug 'Shougo/vimproc.vim', {'do' : 'make'}
	Plug 'vim-erlang/vim-erlang-runtime'
	Plug 'vim-erlang/vim-erlang-tags'
call plug#end()
" 主题
"colorscheme solarized
colorscheme onedark
"set background=dark
" 基础编辑器设置
set nu
syntax on
"set cuc
"set cul
" 启用折叠
set foldenable 
set foldmethod=manual
set bufhidden=hide 
set ruler
set rulerformat=%15(L:%l\ C:%c\ %p%%%)
"set mouse=a 
set autoindent
set ai
set showmatch 
set scrolloff=5
set tabstop=4
set softtabstop=4 
set shiftwidth=4 
set sw=4
set tabstop=4
set backspace=indent,eol,start
set rtp+=$HOME/Project/lint/misc/vim
"inoremap ( ()<ESC>i
"inoremap { {}<ESC>i
"inoremap [ []<ESC>i
"inoremap < <><ESC>i
"inoremap ' ''<ESC>i
""inoremap " ""<ESC>i
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
"autocmd VimEnter * NERDTree | wincmd p
"autocmd VimEnter * Minimap

"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
"自动格式化python
autocmd BufWritePost *.py call flake8#Flake8()
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
filetype plugin indent on

execute pathogen#infect()

" lsp settings
set foldmethod=expr foldexpr=lsp#ui#vim#folding#foldexpr() foldtext=lsp#ui#vim#folding#foldtext()

" onedark setting for tmux
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
