return {
    'rmagatti/goto-preview',
    event = {'BufReadPre', 'BufNewFile'},
    config = function()
        local goto_preview = require("goto-preview")
        goto_preview.setup{}

        local keymap = vim.keymap
        keymap.set("n", "<leader>gd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
        keymap.set("n", "<leader>gc", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
    end,
}
