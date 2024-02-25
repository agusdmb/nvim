local function basic_setup()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = true,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	-- 	border = "rounded",
	-- })

	-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	-- 	border = "rounded",
	-- })
end

local function setup_mason()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
end

local function setup_mason_lspconfig()
	require("mason-lspconfig").setup({
		ensure_installed = { "pyright", "lua_ls" },
	})

	require("mason-lspconfig").setup_handlers({
		function(server_name) -- default handler (optional)
			require("lspconfig")[server_name].setup({})
		end,
		["lua_ls"] = function()
			require("lspconfig")["lua_ls"].setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
							checkThirdParty = false,
						},
					},
				},
			})
		end,
		["pyright"] = function()
			require("lspconfig")["pyright"].setup({
				settings = {
					python = {
						analysis = {
							-- diagnosticMode = "openFilesOnly",
							-- typeCheckingMode = "strict",
						},
					},
				},
			})
		end,
	})
end

local function setup_lspconfig()
	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
	-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })
			-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
			-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
			-- vim.keymap.set("n", "<space>wl", function()
			-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			-- end, opts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Type definition" })
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
			vim.keymap.set(
				{ "n", "v" },
				"<space>Ca",
				vim.lsp.buf.code_action,
				{ buffer = ev.buf, desc = "Code action" }
			)
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, { buffer = ev.buf, desc = "Format" })
		end,
	})
end

local function setup_null_ls()
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			null_ls.builtins.diagnostics.ruff,
			null_ls.builtins.diagnostics.mypy.with({

				-- command = "dmypy",
				-- args = function(params)
				-- 	local t1 = {
				-- 		"run",
				-- 		"--timeout",
				-- 		"50000000",
				-- 		"--",
				-- 		"--hide-error-context",
				-- 		"--no-color-output",
				-- 		"--show-absolute-path",
				-- 		"--show-column-numbers",
				-- 		"--show-error-codes",
				-- 		"--no-error-summary",
				-- 		"--no-pretty",
				-- 		"--cache-fine-grained",
				-- 		"--sqlite-cache",
				-- 		--'--shadow-file',
				-- 		--params.bufname,
				-- 		--params.temp_path,
				-- 		--params.bufname,
				-- 	}
				-- 	local t2 = vim.lsp.buf.list_workspace_folders()
				-- 	for _, v in ipairs(t2) do
				-- 		table.insert(t1, v)
				-- 	end
				-- 	return t1
				-- end,
				-- timeout = 500000000,
				-- -- Do not run in fugitive windows, or when inside of a .venv area
				-- runtime_condition = function(params)
				-- 	if string.find(params.bufname, "fugitive") or string.find(params.bufname, ".venv") then
				-- 		return false
				-- 	else
				-- 		return true
				-- 	end
				-- end,
			}),
			-- null_ls.builtins.diagnostics.pylint,
			null_ls.builtins.code_actions.refactoring,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.isort,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.ruff,
		},
	})
end

local function setup_mason_null_ls()
	require("mason-null-ls").setup({
		ensure_installed = { "debugpy", "stylua" },
		automatic_installation = false,
		handlers = {},
	})
end

return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"nvimtools/none-ls.nvim",
		"jay-babu/mason-null-ls.nvim",
		-- {
		-- 	"j-hui/fidget.nvim",
		-- 	config = true,
		-- 	branch = "legacy",
		-- },
		{ "folke/neodev.nvim", config = true },
		-- {
		-- 	"ray-x/lsp_signature.nvim",
		-- 	opts = { hint_enable = true },
		-- },
		{
			"ThePrimeagen/refactoring.nvim",
			config = function()
				require("refactoring").setup()
			end,
			dependencies = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-treesitter/nvim-treesitter" },
			},
		},
		{
			"rmagatti/goto-preview",
			config = function()
				require("goto-preview").setup({})
				vim.api.nvim_set_keymap(
					"n",
					"gpd",
					"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
					{ noremap = true, silent = true, desc = "Preview definition" }
				)
				vim.api.nvim_set_keymap(
					"n",
					"gpt",
					"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
					{ noremap = true, silent = true, desc = "Preview type definition" }
				)
				vim.api.nvim_set_keymap(
					"n",
					"gpi",
					"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
					{ noremap = true, silent = true, desc = "Preview implementation" }
				)
				vim.api.nvim_set_keymap(
					"n",
					"gP",
					"<cmd>lua require('goto-preview').close_all_win()<CR>",
					{ noremap = true, silent = true, desc = "Close all windows" }
				)
				vim.api.nvim_set_keymap(
					"n",
					"gpr",
					"<cmd>lua require('goto-preview').goto_preview_references()<CR>",
					{ noremap = true, silent = true, desc = "Preview references" }
				)
			end,
		},
	},
	config = function()
		-- Order matters here
		basic_setup()
		setup_mason()
		setup_mason_lspconfig()
		setup_lspconfig()
		setup_mason_null_ls()
		setup_null_ls()
	end,
	event = "BufRead",
	cmd = { "LspRestart", "Mason" },
}
