local wezterm = require("wezterm")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("Hack Nerd Font")
config.color_scheme = "Solarized (dark) (terminal.sexy)"

return config
