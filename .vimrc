set hidden                  " TextEdit might fail if hidden is not set.
set nobackup                " Some language servers have issues with backup files
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes          " Always show the signcolumn, otherwise it would shift the text each time
set tabstop=2               " Set tab space
set cursorline              " Highlight current line
set hlsearch                " Highlight searched pattern
set shiftwidth=2            " Set shift width
set expandtab               " Insert space when tab is pressed
set laststatus=2            " Always display status line
set noswapfile              " Do not create swap file
set noshowmode              " Hide '-- INSERT --' from status line
set encoding=utf-8          " Set file encoding
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed     "OSX
else
  set clipboard=unnamedplus "Linux
endif
set number                  " Display line number
set relativenumber          " Display relative line number
set rtp+=~/.fzf             " Set Fuzzy Finder
syntax on                   " Enable syntax hilighting
filetype plugin indent on   " Detect filetype that is edited, enable indent, plugin for specific file
set completeopt+=noinsert
set regexpengine=1
set modifiable
if has("nvim")
    set inccommand=nosplit
endif


"------------------------- Custom Keybindings -----------------------

let mapleader = ","
noremap \ ,
map <Leader> <Plug>(easymotion-prefix)
imap <Leader>p <C-r>0
map <Leader>, :Buffers<CR>
nmap <Leader>f <Plug>(FerretAckWord)
nmap <Leader>e :Fern . -drawer -toggle<CR>
nnoremap <Leader>vr :source $MYVIMRC<CR>

" Use git files inside git repo
map <expr> <C-p> fugitive#head() != '' ? ':GFiles --cached --others --exclude-standard<CR>' : ':Files<CR>'
map <C-S-i> :Prettier<CR>
nnoremap <silent> <Space> :nohlsearch<CR> 
imap cll console.log()<Esc><S-f>(a
vmap cll yocll<Esc>p
nmap cll yiwocll<Esc>p
imap kj <ESC>
nmap <Leader>w :w<CR>
nmap <Leader>q :q!<CR>


let g:move_key_modifier = 'A'
let g:vim_json_conceal=0
let g:Hexokinase_highlighters = ['foregroundfull']

" Tab management
map <leader>tn :tabnext<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Save buffers
nmap <Leader>w :w!<cr>
nmap <Leader>bd :bd<CR>

" Move between windows
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

autocmd FileType rust map <buffer> <Leader>r :RustRun<CR>
autocmd FileType rust nmap <buffer> <Leader>p :RustFmt<CR>

let g:nnn#layout = { 'window': {'width': 0.8, 'height': 0.8, 'highlight': 'Debug' } }

" Fzf config
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8}}
let $FZF_DEFAULT_OPTS='--reverse'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
nmap <LEADER>gg :Gstatus<CR>
nmap <LEADER>ga :Git add -- .<CR>
nmap <LEADER>gc :Commits<CR>
nmap <LEADER>bc :BCommits<CR>
nnoremap <Leader>pp :Dispatch! git push<cr>
nmap <LEADER>gb :Git branch<CR>
nmap <LEADER>gf :GitGutterFold<CR>
nmap <LEADER>/ :BLines<CR>

nmap <Leader>ct :ContextToggle<CR>
let g:context_enabled = 0

" Fern config
function! s:init_fern() abort
  nnoremap <buffer> <C-h> <C-w>h
  nnoremap <buffer> <C-l> <C-w>l
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END



" ---------------------- CoC ----------------------------
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"  ------------------------- Prettier ---------------------------------

let g:prettier#config#print_width = 80                      " Max line length that prettier will wrap on, default: 80
let g:prettier#exec_cmd_async = 1                           " Force prettier to run async
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


"  ------------------------- Theme ------------------------------------

set background=dark
"set background=light
set termguicolors         " Enable true colors support

"let ayucolor="light"     " for light version of theme
"let ayucolor="mirage"    " for mirage version of theme
"let ayucolor="dark"      " for dark version of theme

"let g:material_theme_style = 'lighter'
colorscheme gruvbox

"  ------------------------- Airline ----------------------------------

let g:airline_theme='gruvbox'
" let g:airline_theme='ayu_mirage'
let g:indentLine_char = '¦'
let g:indentLine_first_char = '¦'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 100


"  ------------------------- Plugins ----------------------------------


call plug#begin('~/.vim/plugged')

Plug 'prettier/vim-prettier'
Plug 'ayu-theme/ayu-vim'
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'kaicataldo/material.vim'
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'
Plug 'easymotion/vim-easymotion'
Plug 'wincent/ferret'
Plug 'mhinz/vim-grepper'
Plug 'mattn/emmet-vim'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'unblevable/quick-scope'  
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'mcchrish/nnn.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-sneak'
Plug 'wellle/context.vim'
Plug 'matze/vim-move'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'stsewd/fzf-checkout.vim'
Plug 'AndrewRadev/splitjoin.vim'


call plug#end()
