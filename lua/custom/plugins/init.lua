-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
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
  {
    'Decodetalkers/csharpls-extended-lsp.nvim',
    dependenies = { 'neovim/nvim-lspconfig' },
    config = function()
      require('csharpls_extended').buf_read_cmd_bind()
    end,
  },
}
