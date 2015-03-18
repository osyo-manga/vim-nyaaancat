scriptencoding utf-8
if exists('g:loaded_nyaaancat')
  finish
endif
let g:loaded_nyaaancat = 1

let s:save_cpo = &cpo
set cpo&vim


command! -nargs=? NyaancatStart
\	call nyaaancat#start(<f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
