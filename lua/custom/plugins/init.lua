-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

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
    'seblyng/roslyn.nvim',
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      filewatching = 'off',
      -- your configuration comes here; leave empty for default settings
    },
  },
  {
    'gregorias/coerce.nvim',
    tag = 'v4.1.0',
    config = true,
  },
  'alvan/vim-closetag',
  {
    'clabby/difftastic.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'folke/snacks.nvim',
    },
    opts = {
      download = true,
      vcs = 'git',
      snacks_picker = {
        enabled = true,
      },
    },
  },
}
