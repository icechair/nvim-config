return
{
    { "nvim-tree/nvim-web-devicons" },
    {
        "folke/trouble.nvim",
        config = function()
            local trouble = require("trouble")
            trouble.setup({})
            vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end, { desc = "toggle trouble" })
            vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end,
                { desc = "workspace diagnostics" })
            vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end,
                { desc = "document diagnostics" })
            vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end, { desc = "quickfix" })
            vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end, { desc = "loc list" })
            vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end, { desc = "lsp refs" })
        end,
    }
}
