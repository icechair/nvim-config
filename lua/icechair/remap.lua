vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc="leave file"})
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>b", function()
        vim.o.list = not vim.o.list
end, {desc ="toggle whitespaces"})

