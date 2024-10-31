return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Debugger: Continue",
		},
		-- Need to change somehow
		{
			"<F9>",
			function()
				local dap = require("dap")
				if dap.session() ~= nil then
					dap.step_over({ steppingGranularity = "line" })
				end
			end,
			desc = "Debugger: Step Into"
		}
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸" },
			mappings = {
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			expand_lines = vim.fn.has("nvim-0.7"),
			-- layouts = {
			-- 	{
			-- 		elements = {
			-- 			"scopes",
			-- 		},
			-- 		size = 0.3,
			-- 		position = "right"
			-- 	},
			-- 	{
			-- 		elements = {
			-- 			"repl",
			-- 			"breakpoints"
			-- 		},
			-- 		size = 0.3,
			-- 		position = "bottom",
			-- 	},
			-- },
			-- floating = {
			-- 	max_height = nil,
			-- 	max_width = nil,
			-- 	border = "single",
			-- 	mappings = {
			-- 		close = { "q", "<Esc>" },
			-- 	},
			-- },
			windows = { indent = 1 },
			render = {
				max_type_length = nil,
			},
		})
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
