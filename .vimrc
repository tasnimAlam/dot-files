"  ************************************************************************
"  **------------------------- Configurations ---------------------------**
"  ************************************************************************

set tabstop=2               " Set tab space
set cursorline              " Highlight current line
"set hlsearch                " Highlight searched pattern
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
set completeopt+=noinsert
set regexpengine=1



"  ************************************************************************
"  **------------------------- Custom Keybindings -----------------------**
"  ************************************************************************


let mapleader = ","
let g:EasyMotion_leader_key = '<LEADER>'
let g:user_emmet_leader_key=','
let g:vim_json_syntax_conceal = 0
imap kj <ESC>
nnoremap <silent> <Space> :nohlsearch<CR> 
nmap <LEADER>ne :NERDTreeToggle<CR>
map <C-S-i> :Prettier<CR>
map ; :exec finddir(".git", ".") == '.git' ? ":GFiles" : ":Files"<CR>
nmap <LEADER>f <Plug>(FerretAckWord)
imap cll console.log()<Esc><S-f>(a
vmap cll yocll<Esc>p
nmap cll yiwocll<Esc>p

"Zeal Vim
nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZVVisSelection
nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
nmap <LEADER>gs :Gstatus<CR>
nmap <LEADER>ga :Git add -- .<CR>
nmap <LEADER>gc :Gcommit<CR>
nmap <LEADER>gl :0Glog --oneline<CR>
nmap <LEADER>gp :Gpush<CR>


"  ************************************************************************
"  **--------------------------- Ale ------------------------------------**
"  ************************************************************************

let g:ale_completion_enabled = 1
let g:ale_fixers = ['prettier', 'eslint']         " Fix files with prettier, and then ESLint.
let g:ale_fix_on_save = 1
let b:ale_linter_aliases = ['javascript', 'vue']  " Run both javascript and vue linters for vue files.
let b:ale_linters = ['eslint', 'vls']             " Select the eslint and vls linters.
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1



"  ************************************************************************
"  **------------------------- Prettier ---------------------------------**
"  ************************************************************************

let g:prettier#config#print_width = 80                      " Max line length that prettier will wrap on, default: 80
let g:prettier#config#tab_width = 2                         " Number of spaces per indentation level, default: 2
let g:prettier#config#use_tabs = 'true'                     " Use tabs over spaces, default: false
let g:prettier#config#semi = 'true'                         " Print semicolons, default: true
let g:prettier#config#single_quote = 'false'                " Single quotes over double quotes, default: false
let g:prettier#config#bracket_spacing = 'true'              " Print spaces between brackets, default: true
let g:prettier#config#jsx_bracket_same_line = 'false'       " Put > on the last line instead of new line, default: false
let g:prettier#config#arrow_parens = 'avoid'                " avoid|always  default: avoid
let g:prettier#config#trailing_comma = 'none'               " none|es5|all  default: none
let g:prettier#config#parser = 'flow'                       " flow|babylon|typescript|css|less|scss|json|graphql|markdown  default: babylon
let g:prettier#config#config_precedence = 'prefer-file'     " cli-override|file-override|prefer-file
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"autocmd FileType vue syntax sync fromstart
"autocmd BufNewFile,BufRead *.vue set ft=vue



"  ************************************************************************
"  **------------------------- Theme ------------------------------------**
"  ************************************************************************

set background=dark
set termguicolors         " Enable true colors support

"let ayucolor="light"     " for light version of theme
let ayucolor="mirage"    " for mirage version of theme
"let ayucolor="dark"      " for dark version of theme

colorscheme ayu
"colorscheme onedark
"colorscheme PaperColor
"colorscheme material
"colorscheme solarized8


"  ************************************************************************
"  **------------------------- Airline ----------------------------------**
"  ************************************************************************

"let g:airline_theme='material'
let g:airline_theme='ayu_mirage'
let g:indentLine_char = '¦'
let g:indentLine_first_char = '¦'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
"let g:indentLine_color_term = 239


"  ************************************************************************
"  **------------------------- NerdTree ---------------------------------**
"  ************************************************************************

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif""
set completeopt-=preview
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

autocmd FileType javascript set formatprg=prettier\ --stdin       " Set prettier for auto complete
autocmd FileType javascript set number                            " Set line number on specific files only
autocmd FileType php set number
autocmd FileType css set number
autocmd FileType vue syntax sync fromstart


"  ************************************************************************
"  **------------------------- Plugins ----------------------------------**
"  ************************************************************************


call plug#begin('~/.vim/plugged')

Plug 'prettier/vim-prettier'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'chrisbra/NrrwRgn'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'danro/rename.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
"Plug 'lifepillar/vim-solarized8'
"Plug 'tyrannicaltoucan/vim-quantum'
"Plug 'posva/vim-vue'
"Plug 'kaicataldo/material.vim'
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'
Plug 'zxqfl/tabnine-vim'
Plug 'w0rp/ale'
Plug 'easymotion/vim-easymotion'
Plug 'wincent/ferret'
Plug 'mhinz/vim-grepper'
"Plug 'KabbAmine/zeavim.vim'
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'ap/vim-css-color'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'joshdick/onedark.vim'


call plug#end()
