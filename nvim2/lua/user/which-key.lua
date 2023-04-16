local M = {}
local options = {}

function M.setup()
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  require("which-key").register({
    a = { "<cmd>Alpha<CR>", "Alpha" },
    w = { "<cmd>w!<CR>", "Save" },
    q = { "<cmd>q!<CR>", "Quit" },
    c = { "<cmd>BufferKill<CR>", "Close Buffer" },
    h = { "<cmd>nohlsearch<CR>", "No Highlight" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  }, { prefix = "<leader>" })
end

return M
