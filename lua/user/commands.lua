local function disable_diagnostic_ui()
	vim.diagnostic.config({ virtual_text = false, underline = false })
end

local function enable_diagnostic_ui()
	vim.diagnostic.config({ virtual_text = true, underline = true })
end

vim.api.nvim_create_user_command("SplitLine", ":s/\\s\\+/\r/g | :nohlsearch", {})
vim.api.nvim_create_user_command("DiagnosticOff", disable_diagnostic_ui, {})
vim.api.nvim_create_user_command("DiagnosticOn", enable_diagnostic_ui, {})
