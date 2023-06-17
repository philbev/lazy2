local status_ok,notify = pcall(require, 'notify')
if not status_ok then
    return
end

--vim.notify = require'notify'

notify.setup({
    background_colour = '#00ffff'
})

vim.notify = notify
