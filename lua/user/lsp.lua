local lvim_lsp = require('lvim.lsp')
local ts = require('typescript')

-- configure tsserver server manually.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local common_on_attach = lvim_lsp.common_on_attach
local common_capabilities = lvim_lsp.common_capabilities()

-- Typescript config using typescript.nvim
ts.setup({
  server = {
    root_dir = require('lspconfig.util').root_pattern('.git'),
    capabilities = common_capabilities,
    on_attach = common_on_attach,
    on_init = lvim_lsp.common_on_init,
  },
})

-- -- Keeping this here for reference
require("lvim.lsp.manager").setup("tsserver", {
  root_dir = require('lspconfig.util').root_pattern('.git'),
  on_attach = common_on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
  cmd = {
    "typescript-language-server",
    "--stdio",
  },
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    command = "prettierd",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
      "json",
    }
  },
})

local linters = require "lvim.lsp.null-ls.linters"
linters.setup({
  {
    command = "eslint_d",
    filetypes = { "javascript", "typescript", "typescriptreact", "json" }
  },
})

lvim.lsp.diagnostics.float.max_width = 120
lvim.lsp.diagnostics.float.focusable = true

-- local kind = require('user.kind')
-- lvim.builtin.which_key.mappings["l"]["a"] = {
--   "<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>",
--   kind.icons.magic ..
--   "Code Actions" }
-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

-- -- Setup lsp.
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

-- local capabilities = require("lvim.lsp").common_capabilities()

-- require("typescript").setup {
--   disable_commands = false, -- prevent the plugin from creating Vim commands
--   debug = false,            -- enable debug logging for commands
--   go_to_source_definition = {
--     fallback = true,        -- fall back to standard LSP definition on failure
--   },
--   server = {
--     -- pass options to lspconfig's setup method
--     on_attach = require("lvim.lsp").common_on_attach,
--     on_init = require("lvim.lsp").common_on_init,
--     capabilities = capabilities,
--   },
-- }

-- -- Set a formatter.
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "prettierd", filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "css" } },
-- }


-- -- Set a linter.
-- local linters = require("lvim.lsp.null-ls.linters")
-- linters.setup({
--   { command = "eslint_d", filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" } },
-- })
