set hidden                  " TextEdit might fail if hidden is not set.
set nobackup                " Some language servers have issues with backup files
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes          " Always show the signcolumn, otherwise it would shift the text each time
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
set modifiable


"------------------------- Custom Keybindings -----------------------

let mapleader = ","
noremap \ ,
let g:EasyMotion_leader_key = '<LEADER>'
let g:vim_json_conceal=0
imap kj <ESC>
imap <LEADER>p <C-r>0
nnoremap <silent> <Space> :nohlsearch<CR> 
nmap <LEADER>ne :NERDTreeToggle<CR>
map <C-S-i> :Prettier<CR>
"map <C-p> :exec finddir(".git", ".") == '.git' ? ":GFiles" : ":Files"<CR>
map <C-p> :Files<CR>
nmap <LEADER>f <Plug>(FerretAckWord)
imap cll console.log()<Esc><S-f>(a
vmap cll yocll<Esc>p
nmap cll yiwocll<Esc>p



command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
nmap <LEADER>gs :Gstatus<CR>
nmap <LEADER>ga :Git add -- .<CR>
nmap <LEADER>gc :Gcommit<CR>
nmap <LEADER>gl :0Glog --oneline<CR>
nmap <LEADER>gp :Git push<CR>
nmap <LEADER>gb :Git branch<CR>




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

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

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



"  --------------------------- Ale ------------------------------------

let g:ale_completion_enabled = 1
let g:ale_fixers = ['prettier', 'eslint']         " Fix files with prettier, and then ESLint.
let g:ale_fix_on_save = 0
let b:ale_linter_aliases = ['javascript', 'vue']  " Run both javascript and vue linters for vue files.
let b:ale_linters = ['eslint', 'vls']             " Select the eslint and vls linters.
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1



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

"set background=dark
"set background=light
set termguicolors         " Enable true colors support

"let ayucolor="light"     " for light version of theme
let ayucolor="mirage"    " for mirage version of theme
"let ayucolor="dark"      " for dark version of theme

"let g:material_theme_style = 'lighter'
colorscheme ayu
"colorscheme onedark
"colorscheme PaperColor
"colorscheme material
"colorscheme solarized8


"  ------------------------- Airline ----------------------------------

"let g:airline_theme='material'
let g:airline_theme='ayu_mirage'
let g:indentLine_char = '¦'
let g:indentLine_first_char = '¦'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 100
"let g:indentLine_color_term = 239


"  ------------------------- NerdTree ---------------------------------

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif""
set completeopt-=preview
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

autocmd FileType javascript set formatprg=prettier\ --stdin       " Set prettier for auto complete
autocmd FileType javascript set number                            " Set line number on specific files only
autocmd FileType php set number
autocmd FileType css set number
"autocmd FileType vue syntax sync fromstart


"  ------------------------- Plugins ----------------------------------


call plug#begin('~/.vim/plugged')

Plug 'prettier/vim-prettier'
"Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'scrooloose/nerdtree'
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
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
"Plug 'lifepillar/vim-solarized8'
"Plug 'tyrannicaltoucan/vim-quantum'
Plug 'kaicataldo/material.vim'
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'
"Plug 'zxqfl/tabnine-vim'
Plug 'w0rp/ale'
Plug 'easymotion/vim-easymotion'
Plug 'wincent/ferret'
Plug 'mhinz/vim-grepper'
"Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
"Plug 'ap/vim-css-color'
"Plug 'SirVer/ultisnips'
"Plug 'joshdick/onedark.vim'
Plug 'mattn/emmet-vim'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'unblevable/quick-scope'  
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psliwka/vim-smoothie'
call plug#end()
