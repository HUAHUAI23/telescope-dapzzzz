local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local make_entry = require("telescope.make_entry")

-- {
--     type={"filetype"}
--     ...
-- }
local Dapzzzz = {}
Dapzzzz.__index = Dapzzzz
function Dapzzzz:new(opts)
	opts = opts or {}
	local obj = setmetatable({}, self)
	return obj
end

function Dapzzzz:start(opts)
	opts = opts or {}
	-- vim.loop.cwd()
	opts.cwd = vim.fn.getcwd()
	local confp = vim.fn.input(opts.cwd .. [[/ +: ]], "")
	if confp ~= "" then
		opts.cwd = opts.cwd .. "/" .. confp
	else
		-- NOTE: default is .vscode
		opts.cwd = opts.cwd .. "/" .. ".vscode"
	end
	-- TODO: remove hidden files
	opts.find_command = opts.find_command or { "ls", "-a" }
	-- make file icon (make_entry.gen_from_file(opts))
	opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)
	opts.previewer = conf.file_previewer(opts)
	pickers
		.new(opts, {
			prompt_title = "load DAP configure",
			finder = finders.new_oneshot_job(opts.find_command, opts),
			sorter = conf.file_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				map(
					"n",
					"<cr>",
					(function()
						local load_dap_conf = function()
							actions.close(prompt_bufnr)
							local selection = action_state.get_selected_entry()
							vim.schedule(function()
								-- local adapterAndFt = [[{cppdbg = { "c", "cpp" }}]]
								-- loadstring 将字符串转变成table https://blog.csdn.net/yuanfengyun/article/details/23408549
								-- local typeConf = loadstring("return " .. adapterAndFt)()
								local adapter = vim.fn.input("adapter: ", "")
								local typeConf = {}
								typeConf[adapter] = {}
								local filetype = vim.fn.input("filetype: ", "")
								table.insert(typeConf[adapter], filetype)
								-- print(vim.inspect(typeConf))
								require("dap.ext.vscode").load_launchjs(opts.cwd .. [[/]] .. selection[1], typeConf)
								-- require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "cpp" } })
								vim.cmd([[edit ]] .. opts.cwd .. [[/]] .. selection[1])
							end)
						end
						return load_dap_conf
					end)()
				)
				map(
					"n",
					"e",
					(function()
						local edit_dapzzzz = function()
							actions.close(prompt_bufnr)
							local selection = action_state.get_selected_entry()
							vim.cmd([[edit ]] .. opts.cwd .. "/" .. selection[1])
						end
						return edit_dapzzzz
					end)()
				)
				return true
			end,
		})
		:find()
end

-- test
-- local a = Dapzzzz:new({})
-- a:start({})

return Dapzzzz
