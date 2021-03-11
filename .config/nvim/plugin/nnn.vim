if exists('g:loaded_nnn') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

command! NnnNeo lua require'nnn-neo'.run()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_nnn = 1
 
