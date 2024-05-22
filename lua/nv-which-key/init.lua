local wk = require("which-key")

-- leader prefix
wk.register({
	b = {
		name = "bufferline",
		["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Buffer 1" },
		["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Buffer 2" },
		["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Buffer 3" },
		["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Buffer 4" },
		["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Buffer 5" },
		["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Buffer 6" },
		["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "Buffer 7" },
		["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "Buffer 8" },
		n = { "<cmd>BufferLineCycleNext<cr>", "Buffer Next" },
		p = { "<cmd>BufferLineCyclePrev<cr>", "Buffer Prev" },
		c = {
			name = "close",
			c = { "<cmd>BufferLineCloseOthers<cr>", "Close but this" },
			l = { "<cmd>BufferLineCloseLeft<cr>", "Close left" },
			r = { "<cmd>BufferLineCloseRight<cr>", "Close right" }
		}
	},
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find file" },
		r = { "<cmd>Telescope oldfiles<cr>", "Recent files", noremap=true },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		g = { "<cmd>Telescope live_grep<cr>", "Telescope grep" },
	},
	x = {
		name = "Trouble",
		x = { "<cmd>TroubleToggle<cr>", "Default toggle" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document toggle" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace toggle" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
		l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
		r = { "<cmd>TroubleToggle lsp_references<cr>", "Lsp references" },
		c = { "<cmd>TroubleClose<cr>", "Trouble Close" },
	},
	t = {
		name = "Treesitter",
		g = {
			name = "generator",
			d = { "<cmd>TSCppDefineClassFunc<cr>", "Generate method defintion" },
			i = { "<cmd>TSCppImplWrite<cr>", "hmhm" },
			c = { "<cmd>TSCppMakeConcreteClass<cr>", "hmhm2" },
		}
	},
	c = {
		name ="CMake",
		g = { "<cmd>CMakeGenerate<cr>", "Generate" },
		r = { "<cmd>CMakeRun<cr>", "Run" },
		b = { "<cmd>CMakeBuild<cr>", "Build" },
		d = { "<cmd>CMakeDebug<cr>", "Debug" },
		C = { "<cmd>CMakeClean<cr>", "Clean" },
		c = { "<cmd>CMakeCloseExecutor<cr>", "Close Executor" },
		o = { "<cmd>CMakeOpen<cr>", "Open" },
		i = { "<cmd>CMakeInstall<cr>", "Install" },
		t = { "<cmd>CMakeRunTest<cr>", "Run Test" },
		s = {
            name = "Select",
            t = { "<cmd>CMakeSelectBuildType<cr>", "Build Type" }
        }
	},
    d = {
        name = "Dap",
        b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
        c = { "<cmd>DapContinue<cr>", "Continue" },
        t = { "<cmd>DapTerminate<cr>", "Terminate" },
        r = { "<cmd>DapRestartFrame<cr>", "Restart Frame" }
    }
}, { prefix = "<leader>" })


-- prefix-free config
wk.register({
	-- name = "General",
	["<C-n>"] = { "<cmd>NvimTreeToggle<cr>", "NvimTree Toggle", noremap = true },
	["<C-S-n>"] = { "<cmd>NvimTreeFindFile<cr>", "NvimTree focus on file", noremap = true },
	["<C-A-n>"] = { "<cmd>NvimTreeFocus<cr>", "NvimTree focus", noremap = true },
        ["<C-->"] = { "<cmd>Oil<cr>", "Oil explorer", noremap = true },
})
