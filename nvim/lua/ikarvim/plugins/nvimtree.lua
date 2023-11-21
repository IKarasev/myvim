return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local nvimtree = require("nvim-tree")

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
        
        nvimtree.setup({
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            git = {
                ignore = false,
            },
        })

        vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
        vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
        vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
        vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
        
    end,
}

