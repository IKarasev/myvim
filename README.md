# My NeoVim Configuration

## Remaps

### Core

[./nvim/lua/ikarvim/core/remap.lua](./nvim/lua/ikarvim/core/remap.lua)

```
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move blocks of text with autoindent
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- keep cursor in start of line when inline text
vim.keymap.set("n", "J", "mzJ`z")

-- keep copyied text in buffer after repalce
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Turn of Q command
vim.keymap.set("n", "Q", "<nop>")

-- Replace current word in file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Seach in the middle of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Half page up-down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Nvim copy also copies to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Un\comment block in visual mode
vim.keymap.set("v", "<leader>cc", ":norm i")
vim.keymap.set("v", "<leader>cn", ":norm x")

-- Open terminal in vsplit block
vim.keymap.set("n", "<leader>tev", ":belowright term://bash<CR>")
vim.keymap.set("n", "<leader>teh", ":belowright split term://bash<CR>")
```

### Telescope

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

#### Fancy icons

- link: [https://github.com/nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- custom font: [HackNerdFont](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)
- config: [./nvim/lua/ikarvim/plugins/webdevicons.lua](./nvim/lua/ikarvim/plugins/webdevicons.lua)

#### Status line

lualine.nvim

- link: [https://github.com/nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- config: [./nvim/lua/ikarvim/plugins/lualine.lua](./nvim/lua/ikarvim/plugins/lualine.lua)
