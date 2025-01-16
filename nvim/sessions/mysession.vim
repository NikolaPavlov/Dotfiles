let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/Repos/Dotfiles/nvim/lua/gh/plugins
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
<<<<<<< HEAD
badd +4 ~/Documents/Repos/Dotfiles/nvim/lua/gh/plugins/oil.lua
badd +1 ~/Documents/Repos/Dotfiles/nvim/lua/gh/plugins/bigfile-nvim.lua
||||||| constructed merge base
badd +527 /mnt/core/home/n.pavlov/easypay_core/CORE/lib/post/libupt.pm
badd +295 /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/process_imt_export_trans/soapcomm.log
badd +77 ~/Documents/Repos/Dotfiles/nvim/lua/gh/plugins/telescope.lua
=======
badd +595 /mnt/core/home/n.pavlov/easypay_core/CORE/bin/process_imt_export_trans.pl
badd +485 /mnt/core/home/n.pavlov/easypay_core/CORE/lib/post/libupt.pm
>>>>>>> up
argglobal
%argdel
<<<<<<< HEAD
edit ~/Documents/Repos/Dotfiles/nvim/lua/gh/plugins/oil.lua
||||||| constructed merge base
edit /mnt/core/home/n.pavlov/easypay_core/CORE/lib/post/libupt.pm
=======
edit /mnt/core/home/n.pavlov/easypay_core/CORE/lib/post/libupt.pm
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
>>>>>>> up
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
<<<<<<< HEAD
2
normal! zo
4
normal! zo
let s:l = 4 - ((3 * winheight(0) + 40) / 80)
||||||| constructed merge base
let s:l = 527 - ((22 * winheight(0) + 22) / 45)
=======
let s:l = 485 - ((41 * winheight(0) + 40) / 80)
>>>>>>> up
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
<<<<<<< HEAD
keepjumps 4
normal! 02|
||||||| constructed merge base
keepjumps 527
normal! 013|
=======
keepjumps 485
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("/mnt/core/home/n.pavlov/easypay_core/CORE/lib/post/libupt.pm", ":p")) | buffer /mnt/core/home/n.pavlov/easypay_core/CORE/lib/post/libupt.pm | else | edit /mnt/core/home/n.pavlov/easypay_core/CORE/lib/post/libupt.pm | endif
if &buftype ==# 'terminal'
  silent file /mnt/core/home/n.pavlov/easypay_core/CORE/lib/post/libupt.pm
endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 485 - ((41 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 485
normal! 0
wincmd w
wincmd =
>>>>>>> up
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
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
