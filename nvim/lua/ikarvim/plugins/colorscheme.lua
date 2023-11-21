return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority=1000,
    config = function()
        require('tokyonight').setup({
            style="moon",
            transparent = true,
            on_highlights = function(hl, c)
                hl.TelescopeBorder = {
                    bg = "#1e2030",
                    fg = "#2E4B5D"
                }
            end,
        })

        vim.cmd('colorscheme tokyonight')
    end,
}
