local opt = vim.opt

-- set colorsheme here

--opt.cpoptions+=$
--2 moving around, searching and patterns
opt.incsearch = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
--4 displaying text
opt.wrap = true
opt.linebreak = true
--opt.&showbreak = '↳ '
opt.lazyredraw = true
opt.relativenumber = true
opt.scrolloff = 5
opt.sidescrolloff = 5
--5 syntax, highlighting and spelling
--opt.syntax = on
opt.hlsearch = true
opt.cursorline = true
--opt.colorcolumn = '80'
