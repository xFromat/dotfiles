vim.opt.mouse = ""          -- disable mouse
vim.opt.tabstop = 4         -- tab width = 4 spaces
vim.opt.shiftwidth = 4      -- indent width = 4 spaces
vim.opt.expandtab = false   -- keep tabs as tabs, don't replace with spaces
vim.opt.number = true       -- show absolute line number
vim.opt.relativenumber = true -- show relative line numbers

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
	vim.opt_local.expandtab = false
	vim.opt_local.tabstop = 4
	vim.opt_local.shiftwidth = 4
	end,
})
