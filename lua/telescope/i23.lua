local Dapzzzz = require("dapzzzz")
local dapzzzz
local opts = {}
return require("telescope").register_extension({
	setup = function(ext_config, config)
		-- access extension config and user config
		ext_config = ext_config or {}
		config = config or {} -- user config
		dapzzzz = Dapzzzz:new({})
		for key, value in pairs(config) do
			opts[key] = value
		end
	end,
	exports = {
		dap23 = function()
			dapzzzz:start(opts)
		end,
	},
})
