"  ************************************************************************
"  **------------------------- Configurations ---------------------------**
"  ************************************************************************


set tabstop=2               " Set tab space
set cursorline              " Highlight current line
set hlsearch                " Highlight searched pattern
set shiftwidth=2            " Set shift width
set expandtab               " Insert space when tab is pressed
set laststatus=2            " Always display status line
set noswapfile              " Do not create swap file
set noshowmode              " Hide '-- INSERT --' from status line
set encoding=utf-8          " Set file encoding
set clipboard=unnamedplus   " Access system clipboard
set number                  " Display line number
set relativenumber          " Display relative line number
set rtp+=~/.fzf             " Set Fuzzy Finder
syntax on                   " Enable syntax hilighting
filetype plugin indent on   " Detect filetype that is edited, enable indent, plugin for specific file



"  ************************************************************************
"  **------------------------- Custom Keybindings -----------------------**
"  ************************************************************************

inoremap kj <Esc>           " Map kj as ESC in Insert mode  
map <C-S-i> :Prettier<CR>   " Prettier shortcut
nnoremap <CR> :noh<CR><CR>  "This unsets the "last search pattern" register by hitting return
vnoremap <silent> ;/ :call ToggleComment()<cr> " multiple line comments



"  ************************************************************************
"  **------------------------- Prettier ---------------------------------**
"  ************************************************************************

let g:prettier#config#print_width = 80                      " Max line length that prettier will wrap on, default: 80
let g:prettier#config#tab_width = 2                         " Number of spaces per indentation level, default: 2
let g:prettier#config#use_tabs = 'true'                     " Use tabs over spaces, default: false
let g:prettier#config#semi = 'true'                         " Print semicolons, default: true
let g:prettier#config#single_quote = 'false'                " Single quotes over double quotes, default: false
let g:prettier#config#bracket_spacing = 'true'              " Print spaces between brackets, default: true
let g:prettier#config#jsx_bracket_same_line = 'true'        " Put > on the last line instead of new line, default: false
let g:prettier#config#arrow_parens = 'avoid'                " avoid|always  default: avoid
let g:prettier#config#trailing_comma = 'none'               " none|es5|all  default: none
let g:prettier#config#parser = 'flow'                       " flow|babylon|typescript|css|less|scss|json|graphql|markdown " default: babylon
let g:prettier#config#config_precedence = 'prefer-file'     " cli-override|file-override|prefer-file



"  ************************************************************************
"  **------------------------- Syntastic --------------------------------**
"  ************************************************************************
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'



"  ************************************************************************
"  **------------------------- Theme ------------------------------------**
"  ************************************************************************

set background=dark
set termguicolors         " Enable true colors support

"let ayucolor="light"     " for light version of theme
"let ayucolor="mirage"    " for mirage version of theme
"let ayucolor="dark"      " for dark version of theme
"colorscheme ayu
"colorscheme PaperColor
colorscheme material
"colorscheme solarized



"  ************************************************************************
"  **------------------------- Airline ----------------------------------**
"  ************************************************************************

"let g:airline_theme='material'
let g:airline_theme='quantum'

" IndentLine {{
let g:indentLine_char = '¦'
let g:indentLine_first_char = '¦'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1
" }}


"  ************************************************************************
"  **------------------------- NerdTree ---------------------------------**
"  ************************************************************************

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif""
set completeopt-=preview
map <C-n> :NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map ; :Files<CR>

autocmd FileType javascript set formatprg=prettier\ --stdin       " Set prettier for auto complete
autocmd FileType javascript set number                            " Set line number on specific files only
autocmd FileType php set number
autocmd FileType css set number



function! ToggleComment()
  if matchstr(getline(line(".")), '^\s*\/\/.*$') == ''
    :execute "s:^://:"
   else 
    :execute "s:^\s*//::"
  endif
endfunction


"  ************************************************************************
"  **------------------------- NerdTree ---------------------------------**
"  ************************************************************************

" Set the runtime path to include Vundle and initialize
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' 
Plugin 'Valloric/YouCompleteMe'
Plugin 'prettier/vim-prettier'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'ayu-theme/ayu-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'chrisbra/NrrwRgn'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'Yggdroot/indentLine'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
Plugin 'danro/rename.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'lifepillar/vim-solarized8'
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'posva/vim-vue'
Plugin 'kaicataldo/material.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-syntastic/syntastic'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

