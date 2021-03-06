call plug#begin('~/.vim/plugged')

" small functions
Plug 'tpope/vim-abolish'     "Better substitute :%S//
Plug 'tpope/vim-fugitive'    "Git wrapper :Gsplit
Plug 'tpope/vim-surround'    "Change surrounds <l>cs{(

" Visuals
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'

" Navigation "Plug 'majutsushi/tagbar'    "BUGBUGBUGBUG
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'moll/vim-bbye'
Plug 'rking/ag.vim'

" Auto complete
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" ctags
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" cpp
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'

" python
Plug 'hynek/vim-python-pep8-indent'
Plug 'nvie/vim-flake8'
"Plug 'scrooloose/syntastic'
Plug 'davidhalter/jedi'

" json
Plug 'elzr/vim-json'
Plug 'tpope/vim-jdaddy'

" linux kernel
Plug 'vivien/vim-linux-coding-style'

" Utility
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'wesQ3/vim-windowswap'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'benmills/vimux'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'gilsondev/searchtasks.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-dispatch'

call plug#end()

" appearance
set t_Co=256
syntax enable
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

set cursorcolumn
set cursorline
set number
set nowrap

" behaviour
set splitright
set splitbelow
set showcmd
set hidden
set list
set noerrorbells
set spelllang=en
set clipboard=unnamedplus


silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)


" Indentation
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nolist

" Makefiles
autocmd FileType make setlocal noexpandtab

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#fnamemod = ':t'

" Ctrl+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|hg|svn|__pycache__)$',
                            \ 'file': '\v\.(exe|so|dll|pyc)$',
                            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
                            \ }
autocmd CompleteDone * pclose

" NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Easytags
let g:easytags_async = 1
let g:easytags_syntax_keyword = 'always'
let g:easytags_auto_highlight = 0

" YCM
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_complete_in_strings = 1
let g:ycm_path_to_python_interpreter="python"
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = "✗"
let g:ycm_warning_symbol = "⚠"
let g:ycm_filetype_blacklist = { 'gitcommit': 1,
                               \ 'tagbar':    1,
                               \ 'qf':        1,
                               \ 'notes':     1,
                               \ 'markdown':  1,
                               \ 'unite':     1,
                               \ 'text':      1,
                               \ 'vimwiki':   1,
                               \ 'pandoc':    1,
                               \ 'infolog':   1,
                               \ 'mail':      1
                               \}

" syntastic
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': []
                           \}
let g:syntastic_python_python_exec = '/path/to/python3'
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_checkers=['cppcheck']

" Cpp
let g:cpp_class_scope_highlight = 1

" clang format
let g:clang_format#command = "clang-format-5.0"
let g:clang_format#detect_style_file = 1
" this will be used as a fallback
let g:clang_format#enable_fallback_style = 1
let g:clang_format#code_style = "Google"
let g:clang_format#style_options = { "Standard" : "C++11", "ColumnLimit" : 0, "IndentWidth" : 4 }
"autocmd FileType c,cpp let g:clang_format#auto_format = 1

nmap <leader>kf :LinuxCodingStyle<CR>

"" <C-> move
nmap <C-k> :bnext<CR>
nmap <C-j> :bprev<CR>
nmap <C-l> :wincmd w<CR>
nmap <C-h> :wincmd p<CR>

" NERDTree
nmap <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

nmap <C-m> :TagbarToggle<CR>



" <C-> Plugins
nmap <C-f> :ClangFormat<CR>
nmap <C-y> :YcmCompleter FixIt<CR>
nmap <C-t> :TagbarToggle<CR>
nmap <C-g> :GitGutterToggle<CR>
nmap <C-s> :SyntasticToggleMode<CR>
nmap <C-x> :SyntaxToggle<CR>

nmap <leader>q :qa <CR>

" <leader>
let mapleader = " "
" buffers
nmap <leader>bc :Bdelete<CR>
nmap <leader>bd :Bdelete!<CR>
nmap <leader>bn :enew <CR>

nmap <leader>c :YcmForceCompileAndDiagnostics<CR>
nmap <leader>s  :set spell!<CR>
nmap <leader>ph :CtrlP ~<CR>

" current word commands
nmap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>ws :%s/\<<C-r><C-w>\>/
nmap <leader>wS :%S/\<<C-r><C-w>\>/
nmap <leader>wbs :bufdo! %s/\<<C-r><C-w>\>/
nmap <leader>wbS :bufdo! %S/\<<C-r><C-w>\>/
nmap <leader>wag :Ag <C-r><C-w><cr>

nmap <leader>vimrc :e $MYVIMRC<cr>
nmap <leader>vims :source $MYVIMRC<cr>

" Navigating
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

cnoreabbrev W w
cnoreabbrev q qa
