-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

telescope_builtin = require 'telescope.builtin'

return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    },
  },
  {
    'willothy/flatten.nvim',
    config = true,
    -- or pass configuration with
    opts = {
      window = {
        open = 'tab',
        diff = 'tab_vsplit',
      },
    },
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
  },
  -- {
  --   'Decodetalkers/csharpls-extended-lsp.nvim',
  --   dependenies = { 'neovim/nvim-lspconfig' },
  --   config = function()
  --     require('csharpls_extended').buf_read_cmd_bind()
  --   end,
  -- },
  {
    'Hoffs/omnisharp-extended-lsp.nvim',
    dependenies = { 'neovim/nvim-lspconfig' },
    config = function()
      vim.keymap.set('n', 'grr', function()
        if vim.bo.filetype == 'cs' then
          require('omnisharp_extended').telescope_lsp_references()
        else
          telescope_builtin.lsp_references()
        end
      end, { desc = 'Omnisharp: LSP References' })

      vim.keymap.set('n', 'grd', function()
        if vim.bo.filetype == 'cs' then
          require('omnisharp_extended').telescope_lsp_definition()
        else
          telescope_builtin.lsp_definitions()
        end
      end, { desc = 'Omnisharp: LSP Definition (vsplit)' })

      vim.keymap.set('n', 'grD', function()
        if vim.bo.filetype == 'cs' then
          require('omnisharp_extended').telescope_lsp_type_definition()
        else
          telescope_builtin.lsp_type_definitions()
        end
      end, { desc = 'Omnisharp: LSP Type Definition' })

      vim.keymap.set('n', 'gri', function()
        if vim.bo.filetype == 'cs' then
          require('omnisharp_extended').telescope_lsp_implementation()
        else
          telescope_builtin.lsp_implementations()
        end
      end, { desc = 'Omnisharp: LSP Implementation' })
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      -- { 'github/copilot.vim' },
      {
        'zbirenbaum/copilot.lua',
        opts = {},
      },
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken',
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    'gregorias/coerce.nvim',
    tag = 'v4.1.0',
    config = true,
  },
}
