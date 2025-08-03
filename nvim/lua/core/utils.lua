local utils = {}

-- function utils.keymap(opts)
--     local mode = opts.mode or 'n'
--     local remap = opts.remap or {noremap = true, silent = true}
--     local desc
--     if opts.desc then
--         desc = ('custom: '..opts.desc)
--     end
--     vim.keymap.set(
--         mode,
--         opts.key,
--         opts.cmd,
--         vim.tbl_extend('keep', remap, {desc = desc})
--     )
-- end

function utils.keymap(mode, keymap, command, desc, opts)
    if opts == nil then
        opts = {noremap = true, silent = true}
    end
    if desc ~= nil then
        desc = 'custom: '..desc
    end
    vim.keymap.set(mode, keymap, command, vim.tbl_extend('keep', opts, {desc = desc}))
end


function utils.contains(list, value)
    for _, element in ipairs(list) do
        if element == value then
            return true
        end
    end
    return false
end

return utils
