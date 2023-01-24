-- if (not vim.g.vscode) then
  -- cache
  require "user.impatient"
  require "user.options"
  require "user.keymaps"
  require "user.plugins"
  require "user.theme"
  require "user.cmp"
  require "user.lsp"
  require "user.telescope"
  require "user.treesitter"
  require "user.autopairs"
  require "user.comment"
  require "user.gitsigns"
  require "user.nvim-tree"
  require "user.bufferline"
  require "user.lualine"
  require "user.toggleterm"
  require "user.project"
  require "user.indent-line"
  require "user.alpha"
  require "user.which-key"
-- end

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then

end

if is_win then

end
