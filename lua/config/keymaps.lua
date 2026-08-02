-- general
vim.keymap.set({ "n", "x", "o" }, "H", "0", { desc = "Start of Line" })
vim.keymap.set({ "n", "x", "o" }, "L", "$", { desc = "End of Line" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
	desc = "Open parent directory",
})

-- mini sessions
vim.keymap.set("n", "<leader>ss", function()
	MiniSessions.write(vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))
end, { desc = "Save session" })

vim.keymap.set("n", "<leader>sr", function()
	MiniSessions.select("read")
end, { desc = "Restore session" })

vim.keymap.set("n", "<leader>sd", function()
	MiniSessions.select("delete")
end, { desc = "Delete session" })

-- formatter
vim.keymap.set("n", "<leader>f", ":Format<CR>", { desc = "Format buffer" })
