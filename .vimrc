" General settings
" Syntax highlighting
syntax enable
" No need to be compatible with vi
set nocompatible
" Hybrid line number mode
set relativenumber
set number
" Allow mouse usage
set mouse=nicr
" Auto/smart indentation
set autoindent
set smartindent
" Save .un file with undo history
set undofile
" Backspace can erase multiple characters
set backspace=indent,eol,start
" Highlight current line
set cursorline
" UTF8 encoding
set encoding=utf-8
" Show at least 10 lines between cursor and end of screen
set scrolloff=10
" Tab completion in execute mode
set wildmenu
" Only redraw when needed
set lazyredraw
" Indicate fast terminal
set ttyfast
" Highlight matching bracket
set showmatch
" Wrap text at 84 characters
set textwidth=84
" Highlight column 85
set colorcolumn=85
" Show line/column number
set ruler
" Flash for bell
set visualbell
" Allow bright colours
set t_Co=256

" More natural split settings
set splitright
set splitbelow

" Make Y behave like C and D (yank to end of line)
nnoremap Y y$

" Select last put text with gp
nnoremap gp `[v`]

" Copy to pplx vim clipboard
vnoremap <silent> <leader>y :w! ~/.vim.clipboard<CR>

" Split line with K
nnoremap K i<CR><ESC>
vnoremap K k

" Split line and add quotes with \k and \j
nnoremap <leader>k i"<CR>"<ESC>
nnoremap <leader>j i'<CR>'<ESC>

" Mappings for editing/sourcing vimrc
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

" Modify search options
" Smart case sensitivity
set ignorecase
set smartcase
" Global search and replace by default
set gdefault
" Show matches for pattern while typing
set incsearch
" Highlight matches
set hlsearch
" Turn off highlight with \<space>
nnoremap <silent> <leader><space> :noh<cr>
" Search for visually selected text with //
vnoremap // y/\V<C-R>"<CR>

" Tab settings
filetype off
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Disable autocommenting on new lines
augroup filetype_C
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd FileType c,cpp setlocal comments-=:// comments+=f://
    autocmd FileType c,cpp noremap <buffer> <silent> <leader>3 I//<space><esc>yyPVr=0r/lr/lr<space>jyypVr=0r/lr/lr<space>
    autocmd FileType c,cpp noremap <buffer> <silent> <leader>4 kddjddk^3xI//<space><esc>yyPVr=0r/lr/lr<space>jyypVr=0r/lr/lr<space>
    autocmd FileType c,cpp noremap <buffer> <silent> <leader>5 Istd::cout<space><<<space>"<esc>A"<space><<<space>std::endl;<esc>
    autocmd FileType c,cpp setlocal commentstring=//\ %s
augroup END

" Strip all trailing whitespace with \W
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Toggle paste mode on and off with F3
set pastetoggle=<F3>

" Remap left and right to browse buffers in normal mode
nnoremap <silent> <Left> :bprevious<CR>
nnoremap <silent> <Right> :bnext<CR>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Folding
set foldenable
set foldnestmax=1
" Start with all folds open
set foldlevelstart=1
set foldmethod=syntax

" Fix highlight colour in Sneak (need to call before colorscheme)
augroup fixSneakHighlight
    autocmd!
    autocmd ColorScheme * hi Sneak guifg=black guibg=red ctermfg=black ctermbg=red
    autocmd ColorScheme * hi SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow
    autocmd ColorScheme * hi SneakLabel guifg=white guibg=magenta ctermfg=white ctermbg=green
augroup END

" Use spellcheck in text files
augroup filetype_text
    autocmd!
    autocmd FileType text nnoremap <buffer> <silent> <leader>1 yypVr=
    autocmd FileType text setlocal spell
    autocmd FileType text setlocal textwidth=0
    autocmd FileType text noremap <buffer> <leader>8 ?^\p\s<CR>ygnjPv0r<space>^
augroup END

" Vim file autocommands
augroup filetype_vim
    autocmd!
    "autocmd FileType vim setlocal shortmess+=c
    autocmd FileType vim setlocal textwidth=0
    autocmd FileType vim setlocal wrap
augroup END

" Python file autocommands
augroup filetype_python
    autocmd!
    autocmd Filetype python nnoremap <buffer><silent> <leader>2 I#<space><esc>yyPVr=0r#lr<space>jyypVr=0r#lr<space>
    autocmd Filetype python setlocal nosmartindent
    autocmd Filetype python setlocal textwidth=0
augroup END

" No line wrapping in snakefiles
augroup filetype_snakemake
    autocmd!
    autocmd Filetype snakemake setlocal textwidth=0
augroup END

" Toggle status 
function! ToggleStatus()
    if &laststatus
        set laststatus=0
        set showtabline=0
    else 
        set laststatus=2
        setsetowtabline=1
    endif
endfunction
nnoremap <silent> <leader>tt :call ToggleStatus()<CR>

" Colourscheme
set background=dark
colorscheme solarized

" Timeout
" set timeoutlen=1000
" set ttimeoutlen=200

" Easy insert bash shebang
iab shebang #!/usr/bin/env bash

" Files to ignore in vim wild search
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pdf,*.root,*.o,*.un~

" Plugins
" Vim-plug
call plug#begin()
" Faster editing of large files
Plug 'vim-scripts/LargeFile'
"" Tetris
"Plug 'vim-scripts/TeTrIs.vim'
" " Comments
" Plug 'tpope/vim-commentary'
" " Tab completion
" Plug 'ervandew/supertab'
" NerdCommenter autocommenting
Plug 'scrooloose/nerdcommenter'
" " NerdTree file explorer
" Plug 'scrooloose/nerdtree'
" " Status bar
" Plug 'itchyny/lightline.vim'
" " Syntastic
" Plug 'vim-syntastic/syntastic'
"" Fugitive
"Plug 'tpope/vim-fugitive'
" " Gitgutter
" Plug 'airblade/vim-gitgutter'
" Surround
Plug 'tpope/vim-surround'
" " Abolish
" Plug 'tpope/vim-abolish'
" " Repeat for tpope plugins
" Plug 'tpope/vim-repeat'
" Automatic bracket closing
"Plug 'raimondi/delimitmate'
" " Fuzzy file search
" Plug 'ctrlpvim/ctrlp.vim'
" Undo visualization
Plug 'mbbill/undotree'
" " Buffer closing without closing window (use :Bd)
" Plug 'moll/vim-bbye'
" " Better incremental searching
" Plug 'haya14busa/incsearch.vim'
" " Easy aligning
" Plug 'junegunn/vim-easy-align'
" 2-character version of f and t
Plug 'justinmk/vim-sneak'
" Mappings
Plug 'tpope/vim-unimpaired'
" " More word objects
" Plug 'wellle/targets.vim'
" " Bullet points
" Plug 'dkarter/bullets.vim'
"" Visual split
"Plug 'wellle/visual-split.vim'
" " Easy window resizing
" Plug 'simeji/winresizer'
" " Vim devicons
" Plug 'ryanoasis/vim-devicons'
" " NERDtree syntax highlighting
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" " Distraction-free writing environment
" Plug 'junegunn/goyo.vim'
" " Rainbow parentheses
" Plug 'luochen1990/rainbow'
" " Improvements to quickfix window
" Plug 'romainl/vim-qf'
"" Better cpp syntax highlighting
" "Plug 'octol/vim-cpp-enhanced-highlight'
" Visual indentation
Plug 'Yggdroot/indentLine'
" " Templates for filetypes
" Plug 'noahfrederick/vim-skeleton'
call plug#end()

" Vundle (needed for YouCompleteMe)
" filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" Plugin 'VundleVim/Vundle.vim'
" " YouCompleteMe autocompleter
" Plugin 'Valloric/YouCompleteMe'
"" Colour coding for C family languages
" "Plugin 'jeaye/color_coded'
" call vundle#end()
" filetype plugin indent on

 " NERDcommenter settings
 " Add spaces after comment delimiter by default
 let g:NERDSpaceDelims = 1
 " Use compact syntax for multiline comments
 let g:NERDCompactSexyComs = 1
 " Trim trailing whitespace when uncommenting
 let g:NERDTrimTrailingWhitespace = 1

" " Open NERDTree with ctrl-n
" noremap <silent> <leader>n :NERDTreeToggle<CR>

" Open undotree with \u
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" " Airline settings
" set laststatus=2
" set noshowmode
" let g:lightline = {'colorscheme': 'solarized'}

" " CtrlP settings
" " Mappings
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" " Increase number of results shown in search
" let g:ctrlp_match_window = 'results:20'
" " Open new files in same window
" let g:ctrlp_open_multiple_files = '1vjr'
" let g:ctrlp_open_new_file = 'r'
" " Set working directory to nearest ancestor containing .git
" let g:ctrlp_working_path_mode = 'ra'
" " Ignore files in .gitignore
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" " Syntastic settings
" " Turn off by default for c/cpp (using ycm) and python (annoying for
" " davinci/ganga)
" let g:syntastic_mode_map = { 'passive_filetypes': ['c', 'cpp', 'python'] }
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" " Don't let error list get too big
" let g:syntastic_loc_list_height=4
" " Toggle active/passive mode with \s
" nnoremap <leader>s :SyntasticToggleMode<CR>

" Still autoindent with delimitmate
"let delimitMate_expand_cr = 1
"let delimirMate_expand_space = 1

" Sneak remappings
map + <Plug>Sneak_s
map - <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" " easy-align mappings
" xmap ga <plug>(easyalign)
" nmap ga <plug>(easyalign)
" vmap <Enter> <Plug>(EasyAlign)

" " Incsearch mappings
" " Use incsearch instead of standard
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" " Turn off highlighting when cursor moves
" let g:incsearch#auto_nohlsearch = 1
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)

" " Filetypes to use Bullets.vim
" let g:bullets_enabled_file_types = [
    " \ 'markdown',
    " \ 'text',
    " \ 'gitcommit',
    " \ 'scratch',
    " \ 'tex'
     " \]

" " Devicons settings
" " Pattern matches
" let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['\.sh\.e\d\+'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['\.sh\.o\d\+'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['\.tar\.gz'] = ''
" " Exact filename matches
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['makefile'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore'] = ''
" " Custom extensions
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cut'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['param'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['o'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['log'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['root'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pdf'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tex'] = ''
" " Limit syntax highlighting in NERDTree (speeds it up)
" let g:NERDTreeLimitedSyntax = 1

" Colour modifications
function! s:highlight()
    hi VertSplit ctermfg=0 ctermbg=0
    hi EndOfBuffer ctermfg=8
    hi SignColumn ctermbg=8
    hi GitGutterAdd ctermbg=8 ctermfg=2
    hi GitGutterChange ctermbg=8 ctermfg=3
    hi GitGutterDelete ctermbg=8 ctermfg=1
    hi GitGutterChangeDelete ctermbg=8 ctermfg=1
    hi LineNr ctermbg=8 ctermfg=10
endfunction
augroup my_highlights
    autocmd!
    autocmd ColorScheme * call s:highlight()
augroup end
call s:highlight()

" " Rainbow parentheses off by default
" let g:rainbow_active = 0

" "" Enhanced C++ syntax highlighting
" "let g:cpp_class_scope_highlight = 1

" Indent lines
let g:indentLine_color_term = 0
let g:indentLine_char = '|'

" Large filesize
let g:LargeFile = 0.1
