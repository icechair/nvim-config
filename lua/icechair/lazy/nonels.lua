local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
    "nvimtools/none-ls.nvim",
    name = "null-ls",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.black,
            },
            on_attach = function(client, bufnr)
                vim.api.nvim_clear_autocmds({
                    group = augroup,
                    buffer = bufnr,
                })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        lsp_formatting(bufnr)
                    end,
                })
            end,
        })
    end
}
