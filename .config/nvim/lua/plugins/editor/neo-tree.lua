return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["y"] = "none",
        ["Y"] = "none",
        ["yn"] = function(state)
          local node = state.tree:get_node()
          local filename = node.name
          vim.fn.setreg("+", filename, "c")
          vim.notify("Copied: " .. filename)
        end,
        ["yP"] = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.setreg("+", path, "c")
          vim.notify("Copied: " .. path)
        end,
        ["yp"] = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          local cwd = vim.fn.getcwd()
          local relative = path:gsub("^" .. vim.pesc(cwd) .. "/", "")
          vim.fn.setreg("+", relative, "c")
          vim.notify("Copied: " .. relative)
        end,
      },
    },
  },
}
