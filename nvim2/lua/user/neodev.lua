local M = {}
function M.setup()
  if vim.g.neovide then
    -- vim.o.guifont = "Hack:h14"
    -- vim.opt.guifont = { "Hack Nerd Font", "h14" }
    vim.cmd([[
      set guifont="Hack Nerd Font"
    ]])
  end
end

require("neodev").setup()
