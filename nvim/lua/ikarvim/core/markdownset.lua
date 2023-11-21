vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '*.md',
    command = ":setlocal wrap"
})
