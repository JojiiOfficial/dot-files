local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
  },
}

M.venn = {
  n = {
    ["vn"] = {
      function()
        require("custom.plugins.venn").toggle_maps()
      end,
      "toggle venn mappings",
    },
  },
}

M.truzen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "truzen ataraxis" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "truzen minimal" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "truzen focus" },
  },
}

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "find media" },
  },
}

M.shade = {
  n = {
    ["<leader>s"] = {
      function()
        require("shade").toggle()
      end,

      "toggle shade.nvim",
    },
  },
}


M.navigation = {
  n = {
    ["H"] = { "^", "beginning of line" },
    ["L"] = { "$", "end of line" },
  }
}

M.crates = {
  n = {
    ['cf'] = {
      function ()
        require('crates').show_features_popup()
        vim.api.nvim_set_current_win(vim.fn.bufwinid('$'))
      end,
      "Show features popup"
    },
    ['cv'] = {
      function ()
        require('crates').show_versions_popup()
        vim.api.nvim_set_current_win(vim.fn.bufwinid('$'))
      end,
      "Show version popup"
    },
    ['cu'] = {
      function ()
        require('crates').upgrade_crate()
      end,
      "Show version popup"
    },
    ['ci'] = {
      function ()
        require('crates').open_lib_rs()
      end,
      "Show version popup"
    },
  },
}

return M
