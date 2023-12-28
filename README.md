# My NeoVim Configuration

## Remaps

### Core

[./nvim/lua/ikarvim/core/remap.lua](./nvim/lua/ikarvim/core/remap.lua)

```
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- {{ Move blocks of text with autoindent }} --
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- {{ keep cursor in start of line when inline text }} --
vim.keymap.set("n", "J", "mzJ`z")

-- {{ keep copyied text in buffer after repalce }} --
vim.keymap.set("x", "<leader>p", '"_dP')

-- {{ Turn of Q command }} --
vim.keymap.set("n", "Q", "<nop>")

-- {{ Replace current word in file }} --
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- {{ Seach in the middle of screen }} --
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- {{ Half page up-down }} --
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- {{ Nvim copy also copies to system clipboard }} --
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- {{ Un\comment block in visual mode (inser\remove give chars at start of line) }} --
vim.keymap.set("v", "<leader>cc", ":norm i")
vim.keymap.set("v", "<leader>cn", ":norm x")

-- {{ Open terminal in vsplit block }} --
vim.keymap.set("n", "<leader>tev", ":belowright 50 vsplit term://bash<CR>")
vim.keymap.set("n", "<leader>tt", ":belowright 15 split term://bash<CR>")

-- {{ Add empty lines before and after current line in normal mode }} --
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

-- {{ Win splits manipulations }} --
-- change to vetical
vim.keymap.set("n", "<leader>wv", "<C-w>t<C-w>H")
-- change to horizonstal
vim.keymap.set("n", "<leader>wh", "<C-w>t<C-w>K")
-- resize splits
vim.keymap.set("n", "<C-Left>", ":vertical resize +3<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -3<CR>")
vim.keymap.set("n", "<C-Up>", ":resize +3<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -3<CR>")

```

### Telescope

#### Local

```
mappings = {
    ["<C-s>"] = actions.select_vertical
}
```

#### Global

```
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc='Search files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc='Search in git' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc='Search in buffers' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc='Search string under cursor' })
vim.keymap.set('n', '<leader>fg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc='Promt to search string in files' })

```

### NvimTree

#### Local

```
vim.keymap.set("n", "<C-s>", api.node.open.vertical, opts("Open: Vertical Split"))
```

#### Global

```
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
```

### CMP

```
['<C-j>']= cmp.mapping.select_next_item(),
['<C-k>'] = cmp.mapping.select_prev_item(),
['<C-u>'] = cmp.mapping.scroll_docs(-4),
['<C-d>'] = cmp.mapping.scroll_docs(4),
['<C-f>'] = cmp_action.luasnip_jump_forward(),
['<C-b>'] = cmp_action.luasnip_jump_backward(),
['<C-Space>'] = cmp.mapping.complete(),
['<CR>'] = cmp.mapping.confirm({select=true}),
```

### LSP

```
keymap.set("n", "gD", vim.lsp.buf.declaration, 
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", 
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", 
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", 
keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", 
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, 
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, 
keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
```

### Go-to preview

```
keymap.set("n", "<leader>gd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
keymap.set("n", "<leader>gc", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
```

### Fugitive

```
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gsp", "<cmd>:Git! push<CR>")
```

## Packet manager

[lazy.nvim](https://github.com/folke/lazy.nvim)

- link: [https://github.com/folke/lazy.nvim](https://github.com/folke/lazy.nvim)
- config: [./nvim/lua/ikarvim/lazy.lua](./nvim/lua/ikarvim/lazy.lua)

## Installed plugins

### Beauty

#### Colorscheme

[🏙Tokyo Night](https://github.com/folke/tokyonight.nvim)

- link: https://github.com/folke/tokyonight.nvim
- config: [./nvim/lua/ikarvim/plugins/colorscheme.lua](./nvim/lua/ikarvim/plugins/colorscheme.lua)

#### Treesitter

<a href="https://github.com/nvim-treesitter/nvim-treesitter">![Treesitter](https://github.com/nvim-treesitter/nvim-treesitter/raw/master/assets/logo.png)</a>

- link: [https://github.com/nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) 
- config: [./nvim/lua/ikarvim/plugins/treesitter.lua](./nvim/lua/ikarvim/plugins/treesitter.lua)

#### webdevicons.lua

Fancy icons

- link: [https://github.com/nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- custom font: [HackNerdFont](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)
- config: [./nvim/lua/ikarvim/plugins/webdevicons.lua](./nvim/lua/ikarvim/plugins/webdevicons.lua)

#### lualine.nvim

Status line

- link: [https://github.com/nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- config: [./nvim/lua/ikarvim/plugins/lualine.lua](./nvim/lua/ikarvim/plugins/lualine.lua)

## Editor

### nvim-tree.lua 

File explorer

- link: [https://github.com/nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) 
- config: [./nvim/lua/ikarvim/plugins/nvimtree.lua](./nvim/lua/ikarvim/plugins/nvimtree.lua)

Keymaps

```
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
```

### undotree

Powerfull history visualiser

- link: [https://github.com/mbbill/undotree](https://github.com/mbbill/undotree)
- config: [./nvim/lua/ikarvim/plugins/undotree.lua](./nvim/lua/ikarvim/plugins/undotree.lua)

Keymaps:

```
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
```

### nvim-surround

Surround text with () [] etc.

- link: [https://github.com/kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
- config: [./nvim/lua/ikarvim/plugins/init.lua](./nvim/lua/ikarvim/plugins/init.lua)

Default actions:
- add: `ys{motion}{char}`
- remove: `ds{char}`
- cahnge: `cs{target}{replacement}`

Help: `:h nvim-surround.usage`

### dressing.nvim

Visual replacement for input-select vim.ui actions

- link: [https://github.com/stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim)
- config: [./nvim/lua/ikarvim/plugins/dressing.lua](./nvim/lua/ikarvim/plugins/dressing.lua)

## Git

### vim-fugitive

Nvim git wrapper

- link: [https://github.com/tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- config: [./nvim/lua/ikarvim/plugins/fugitive.lua](./nvim/lua/ikarvim/plugins/fugitive.lua)

Keymaps

```
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gsp", "<cmd>:Git! push<CR>")
```

### gitsigns.nvim

Editor git decoration

- link: [https://github.com/lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- config: [./nvim/lua/ikarvim/plugins/gitsigns.lua](./nvim/lua/ikarvim/plugins/gitsigns.lua)

## Code related

### lsp-zero

Help plugin to configure LSP

- link: [https://github.com/VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)
- installation: [./nvim/lua/ikarvim/plugins/lsp/lspzero.lua](./nvim/lua/ikarvim/plugins/lsp/lspzero.lua)

### mason and mason-lspconfig
![alt text](https://user-images.githubusercontent.com/6705160/177613416-0c0354d2-f431-40d8-87f0-21310f0bba0e.png) 

Mason - Packet manage for lsp, linter, formatter, dap 
mason-lspconfig - install and setup helper for nvim-lsp

- links:
    - [https://github.com/williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
    - [https://github.com/williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- installation: [./nvim/lua/ikarvim/plugins/lsp/mason.lua](./nvim/lua/ikarvim/plugins/lsp/mason.lua)

### nvim-cmp

Autocomplition

- link: [https://github.com/hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- config: [./nvim/lua/ikarvim/plugins/lsp/cmp.lua](./nvim/lua/ikarvim/plugins/lsp/cmp.lua)

Keymaps:

```
["<C-j>"] = cmp.mapping.select_next_item() -- next item in autocomplite menue
["<C-k>"] = cmp.mapping.select_prev_item(), -- prev item in autocomplite menue
["<C-u>"] = cmp.mapping.scroll_docs(-4), -- scroll docs down
["<C-d>"] = cmp.mapping.scroll_docs(4), -- scroll docs up
["<C-f>"] = cmp_action.luasnip_jump_forward(),
["<C-b>"] = cmp_action.luasnip_jump_backward(),
["<C-Space>"] = cmp.mapping.complete(),
["<CR>"] = cmp.mapping.confirm({ select = true }),
```

### LuaSnip

Snippets engine

- link: [https://github.com/L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- config: [./nvim/lua/ikarvim/plugins/luasnip.lua](./nvim/lua/ikarvim/plugins/luasnip.lua) 

### LSP

nvim-lsp, setting and configuring lsp-zero, mason-lspconfig and cmp

config: [./nvim/lua/ikarvim/plugins/lsp/lsp.lua](./nvim/lua/ikarvim/plugins/lsp/lsp.lua)

Notice using additional plugin:
- [antosha417/nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations)

Keymaps:

```
opts.desc = "Go to declaration"
keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

opts.desc = "Show LSP definitions"
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

opts.desc = "Show LSP implementations"
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

opts.desc = "Show LSP type definitions"
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

opts.desc = "Sho LSP references"
keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

opts.desc = "See available code actions"
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

opts.desc = "Smart rename"
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
```

### Goto Preview

previewing native LSP's goto definition, type definition, implementation, declaration and references calls in floating windows

- link: [https://github.com/rmagatti/goto-preview](https://github.com/rmagatti/goto-preview)
- config: [./nvim/lua/ikarvim/plugins/lsp/gotopreview.lua](./nvim/lua/ikarvim/plugins/lsp/gotopreview.lua)

Keymaps:

```
keymap.set("n", "<leader>gd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
keymap.set("n", "<leader>gc", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
```

### conform.nvim

Formatting engine

- link: [https://github.com/stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)
- config: [./nvim/lua/ikarvim/plugins/lsp/formatting.lua](./nvim/lua/ikarvim/plugins/lsp/formatting.lua)

### nvim-lint

Linting plugin

- link: [https://github.com/mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
- config: [./nvim/lua/ikarvim/plugins/lsp/linting.lua](./nvim/lua/ikarvim/plugins/lsp/linting.lua) 

### Neogen

Docstrings, comments, annotations

![alt tex](https://user-images.githubusercontent.com/5306901/141127528-ddff21bb-8da3-43da-8efe-9494a4f231d2.png)

- link: [https://github.com/danymat/neogen](https://github.com/danymat/neogen)
- config: [./nvim/lua/ikarvim/plugins/neogen.lua](./nvim/lua/ikarvim/plugins/neogen.lua)

### Commenting: Comment.nvim

Smart and Powerful commenting plugin for NeoVim

- link: [https://github.com/numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
- config: [./nvim/lua/ikarvim/plugins/commentvim.lua](./nvim/lua/ikarvim/plugins/commentvim.lua)

#### Keymaps

For more detailes got to plugin github page

```
** NORMAL MODE **

`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment

** VISUAL mode **

`gc` - Toggles the region using linewise comment
`gb` - Toggles the region using blockwise comment
```

## Markdown

**markdown-preview.nvim**

- link: [https://github.com/kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
- config: [./nvim/lua/ikarvim/plugins/markdownpreview.lua](./nvim/lua/ikarvim/plugins/markdownpreview.lua)


