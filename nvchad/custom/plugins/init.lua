local overrides = require "custom.plugins.overrides"

return {

  ----------------------------------------- default plugins ------------------------------------------
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lsp_config"
    end,
  },

  -- override default configs
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["nvim-lua/plenary.nvim"] = {},

  ["JojiiOfficial/crates.nvim"] = {
    event = { "BufRead Cargo.toml" },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('custom.plugins.crates')
    end,
  },

  --------------------------------------------- custom plugins ----------------------------------------------
  --
  ["tpope/vim-surround"] = {},
  ["martinsione/darkplus.nvim"] = {},

  ["simrat39/rust-tools.nvim"] = {
     after = "nvim-lspconfig",
     config = function()
       require "custom.plugins.rust_analyzer"
     end,
  },

  -- autoclose tags in html, jsx only
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      local present, autotag = pcall(require, "nvim-ts-autotag")

      if present then
        autotag.setup()
      end
    end,
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["akinsho/toggleterm.nvim"] = {
    config = function ()
      require "custom.plugins.toggleterm"
    end
  },
}
