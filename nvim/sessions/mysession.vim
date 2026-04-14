let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
doautoall SessionLoadPre
silent only
silent tabonly
cd /mnt/web/home/n.pavlov/easypay_web/WEB/mod
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess+=aoO
badd +259 /mnt/core/home/n.pavlov/easypay_core/CORE/methods/table_payer_identification.pm
badd +98 /mnt/core/home/n.pavlov/easypay_core/CORE/methods/table_money_get.pm
badd +54 /mnt/web/home/n.pavlov/easypay_web/WEB/mod/mod_money_get_domestic.pm
badd +259 /mnt/web/home/n.pavlov/easypay_web/WEB/mod/mod_scanned_info.pm
badd +666 /mnt/web/home/n.pavlov/easypay_web/WEB/mod/mod_pay_bills_jwait.pm
badd +1 /mnt/web/home/n.pavlov/easypay_web/WEB/mod/mod_teximupload_home.pm
badd +1371 /mnt/core/home/n.pavlov/easypay_core/CORE/etc/db/money_delivery.def
argglobal
%argdel
edit /mnt/core/home/n.pavlov/easypay_core/CORE/methods/table_money_get.pm
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 138 + 181) / 362)
exe 'vert 2resize ' . ((&columns * 223 + 181) / 362)
argglobal
balt /mnt/core/home/n.pavlov/easypay_core/CORE/etc/db/money_delivery.def
setlocal foldmethod=indent
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=10
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
78
sil! normal! zo
let s:l = 98 - ((39 * winheight(0) + 39) / 79)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 98
normal! 050|
wincmd w
argglobal
if bufexists(fnamemodify("/mnt/web/home/n.pavlov/easypay_web/WEB/mod/mod_pay_bills_jwait.pm", ":p")) | buffer /mnt/web/home/n.pavlov/easypay_web/WEB/mod/mod_pay_bills_jwait.pm | else | edit /mnt/web/home/n.pavlov/easypay_web/WEB/mod/mod_pay_bills_jwait.pm | endif
if &buftype ==# 'terminal'
  silent file /mnt/web/home/n.pavlov/easypay_web/WEB/mod/mod_pay_bills_jwait.pm
endif
setlocal foldmethod=indent
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=10
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
30
sil! normal! zo
297
sil! normal! zo
303
sil! normal! zo
303
sil! normal! zo
357
sil! normal! zo
373
sil! normal! zo
545
sil! normal! zo
586
sil! normal! zo
587
sil! normal! zo
588
sil! normal! zo
589
sil! normal! zc
588
sil! normal! zc
627
sil! normal! zo
627
sil! normal! zc
627
sil! normal! zc
631
sil! normal! zo
631
sil! normal! zo
632
sil! normal! zo
633
sil! normal! zc
651
sil! normal! zo
681
sil! normal! zo
701
sil! normal! zo
724
sil! normal! zo
728
sil! normal! zo
741
sil! normal! zo
let s:l = 679 - ((58 * winheight(0) + 39) / 79)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 679
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 138 + 181) / 362)
exe 'vert 2resize ' . ((&columns * 223 + 181) / 362)
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
