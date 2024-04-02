return {
	"https://github.com/fatih/vim-go.git",
	ft = { "go", "gomod" },
	config = function()
		vim.g.go_doc_keywordprg_enabled = 0
		vim.g.go_play_browser_command = "start chrome %URL%"
	end,
}
