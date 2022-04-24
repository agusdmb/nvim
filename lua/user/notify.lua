local status_ok, notify = pcall(require, "notify")
if status_ok then
    notify("Lua module 'notify' loaded")
else
    return
end

vim.notify = notify
