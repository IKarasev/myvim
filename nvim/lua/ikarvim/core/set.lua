-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.updatetime = 750

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("LOCALAPPDATA") .. "\\nvim-data\\undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "100"

vim.g.mapleader = " "

-- Bash shell set
vim.opt.shell = '"D:\\Program Files\\Git\\usr\\bin\\bash.exe"'
vim.opt.shellcmdflag = "-c"
vim.g.terminal_emulator = '"D:\\Program Files\\Git\\usr\\bin\\bash.exe"'

-- Nvim providers
vim.g.python3_host_prog = "C:\\Program Files\\Python311\\python.exe"
vim.g.node_host_prog = os.getenv("APPDATA") .. "\\npm\\node_modules\\neovim\\bin\\cli.js"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
