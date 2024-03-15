require("icechair.set")
require("icechair.remap")

require("icechair.lazy_init")

local augroup = vim.api.nvim_create_augroup
local ice_group = augroup('icechair', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWritePre" }, {
    group = ice_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = ice_group,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "goto definition", unpack(opts) })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "hover symbol", unpack(opts) })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
            { desc = "workspace symbol", unpack(opts) })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
            { desc = "diag open float", unpack(opts) })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
            { desc = "lsp code action", unpack(opts) })
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
            { desc = "lsp references", unpack(opts) })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { desc = "lsp rename", unpack(opts) })
        vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end,
            { desc = "lsp signature_help", unpack(opts) })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "diag next", unpack(opts) })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "diag prev", unpack(opts) })
        vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format() end, { desc = "lsp format", unpack(opts) })
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
