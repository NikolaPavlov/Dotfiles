let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Documents/Repos/Wiki
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +4 ~/Desktop/temp_nvim/test.rst
badd +0 /tmp/nvimyUJvF0/_build/
badd +0 ~/Documents/Repos/Dotfiles/.bashrc
argglobal
%argdel
$argadd ~/Desktop/temp_nvim/test.rst
edit ~/Desktop/temp_nvim/test.rst
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 29 + 31) / 63)
exe '2resize ' . ((&lines * 30 + 31) / 63)
argglobal
setlocal fdm=expr
setlocal fde=RstFold#GetRstFold()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 4 - ((3 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 0
lcd ~/Desktop/temp_nvim
wincmd w
argglobal
if bufexists("~/Documents/Repos/Dotfiles/.bashrc") | buffer ~/Documents/Repos/Dotfiles/.bashrc | else | edit ~/Documents/Repos/Dotfiles/.bashrc | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 63 - ((14 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
63
normal! 02|
lcd ~/Documents/Repos/Dotfiles
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 29 + 31) / 63)
exe '2resize ' . ((&lines * 30 + 31) / 63)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
