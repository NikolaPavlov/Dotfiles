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
badd +215 /mnt/core/home/n.pavlov/easypay_core/CORE/methods/table_cards_transfer.pm
badd +1 /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/core/hit.log
badd +41 /mnt/core/home/n.pavlov/easypay_core/CORE/bin/on_a1_optimized.pl
argglobal
%argdel
edit /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/core/hit.log
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
balt /mnt/core/home/n.pavlov/easypay_core/CORE/bin/on_a1_optimized.pl
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("/mnt/core/home/n.pavlov/easypay_core/CORE/methods/table_cards_transfer.pm", ":p")) | buffer /mnt/core/home/n.pavlov/easypay_core/CORE/methods/table_cards_transfer.pm | else | edit /mnt/core/home/n.pavlov/easypay_core/CORE/methods/table_cards_transfer.pm | endif
if &buftype ==# 'terminal'
  silent file /mnt/core/home/n.pavlov/easypay_core/CORE/methods/table_cards_transfer.pm
endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
180
normal! zo
218
normal! zo
237
normal! zo
let s:l = 215 - ((35 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 215
normal! 05|
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
