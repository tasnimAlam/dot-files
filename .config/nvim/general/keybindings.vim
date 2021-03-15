"------------------------- Custom Keybindings -----------------------

let mapleader = ","
noremap \ ,
imap <Leader>p <C-r>0
nmap <Leader>F <Plug>(FerretAckWord)
nnoremap <Leader>vr :source $MYVIMRC<CR>
nmap <Leader>o :on<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q!<CR>
nmap <Leader>f :Rg<CR>
nmap <Leader>v :vs<CR>
nnoremap <silent><Leader>1 :source ~/.vimrc \| :PlugInstall<CR>
nnoremap <silent><Leader>2 :source ~/.vimrc \| :PlugUpdate<CR>


" Easymotion config
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>L <Plug>(easymotion-overwin-line)


" Use git files inside git repo
map <expr> <C-p> fugitive#head() != '' ? ':GFiles --cached --others --exclude-standard<CR>' : ':Files<CR>'
nnoremap <silent> <Space> :nohlsearch<CR> 

" console log shortcut
imap cll console.log()<Esc><S-f>(a
vmap cll yocll<Esc>p
nmap cll yiwocll<Esc>p

" Custom commands
command! RemoveComments execute 'g/^\/\|\*/d'
command! BufCurOnly execute '%bdelete|edit#|normal `"'

let g:better_escape_shortcut = 'kj'
let g:move_key_modifier = 'A'
let g:vim_json_conceal=0
let g:Hexokinase_highlighters = ['foregroundfull']

" Tab management
map <leader>tn :tabnext<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Manage buffers
map <Leader>, :Buffers<CR>
nmap <Leader>w :w!<cr>
nmap <Leader>bd :bd<CR>
nnoremap <Leader>bc :BufCurOnly <CR>

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

" Rust development config
" autocmd FileType rust map <buffer> <Leader>r :RustRun<CR>
" autocmd FileType rust nmap <buffer> <Leader>p :RustFmt<CR>

let g:nnn#layout = { 'window': {'width': 1, 'height': 1, 'highlight': 'Debug' } }
let g:nnn#replace_netrw=1

" Fzf config
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1}}
let $FZF_DEFAULT_OPTS='--reverse'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Fugitive Conflict Resolution
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
nmap <Leader>gg :Gstatus<CR>
nmap <Leader>ga :Git add -- .<CR>
nmap <Leader>gc :Commits<CR>
nmap <Leader>gc :GV<CR>
nnoremap <Leader>pp :Dispatch! git push<cr>
nmap <Leader>gb :Git branch<CR>
nmap <Leader>gf :GitGutterFold<CR>
nmap <Leader>/ :BLines<CR>

" Nvim tree config
nnoremap<Leader>e :NvimTreeToggle<CR>
" let g:nvim_tree_bindings = {
"  \ 'edit': ['<CR>', 'o', 'l'],
"  \ 'cd': 'e',
"  \ }

" Fold config
nnoremap <silent> <leader>zj :<c-u>call RepeatCmd('call NextClosedFold("j")')<cr>
nnoremap <silent> <leader>zk :<c-u>call RepeatCmd('call NextClosedFold("k")')<cr>

function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

function! RepeatCmd(cmd) range abort
    let n = v:count < 1 ? 1 : v:count
    while n > 0
        exe a:cmd
        let n -= 1
    endwhile
endfunction
