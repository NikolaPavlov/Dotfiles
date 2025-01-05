let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd /mnt/core/home/n.pavlov/easypay_core/CORE/methods
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +807 /mnt/core/home/n.pavlov/easypay_core/CORE/lib/post/libupt.pm
badd +603 /mnt/core/home/n.pavlov/easypay_core/CORE/bin/process_imt_export_trans.pl
badd +123 /mnt/core/home/n.pavlov/easypay_core/CORE/methods/table_check_upt.pm
badd +50 /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/process_imt_export_trans/soapcomm.log
badd +79 /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/core/soapcomm.log
argglobal
%argdel
edit /mnt/core/home/n.pavlov/easypay_core/CORE/methods/table_check_upt.pm
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/process_imt_export_trans/soapcomm.log
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
127
normal! zo
127
normal! zc
let s:l = 123 - ((32 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 123
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
