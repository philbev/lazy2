--                                           _   _             
--  ___ _   _ _ __ _ __ ___  _   _ _ __   __| | | |_   _  __ _ 
-- / __| | | | '__| '__/ _ \| | | | '_ \ / _` | | | | | |/ _` |
-- \__ \ |_| | |  | | | (_) | |_| | | | | (_| |_| | |_| | (_| |
-- |___/\__,_|_|  |_|  \___/ \__,_|_| |_|\__,_(_)_|\__,_|\__,_|
--                                                             

-- ~/.config/nvim/lua/setup/surround.lua

local status_ok,surround = pcall(require, 'nvim-surround')
if not status_ok then
    return
end

surround.setup({
    keymaps = { -- vim-surround style keymaps
        insert = "ys",
        visual = "S",
        delete = "ds",
        change = "cs",
    },
    surrounds = {
        pairs = {
            ["("] = { "( ", " )" },
            [")"] = { "(", ")" },
            ["{"] = { "{ ", " }" },
            ["}"] = { "{", "}" },
            ["<"] = { "< ", " >" },
            [">"] = { "<", ">" },
            ["["] = { "[ ", " ]" },
            ["]"] = { "[", "]" },
            -- Define pairs based on function evaluations!
            ["i"] = function()
                return {
                    require("nvim-surround.utils").get_input(
                        "Enter the left delimiter: "
                    ),
                    require("nvim-surround.utils").get_input(
                        "Enter the right delimiter: "
                    )
                }
            end,
            ["f"] = function()
                return {
                    require("nvim-surround.utils").get_input(
                        "Enter the function name: "
                    ) .. "(",
                    ")"
                }
            end,
        },
        separators = {
            ["'"] = { "'", "'" },
            ['"'] = { '"', '"' },
            ["`"] = { "`", "`" },
        },
        HTML = {
            ["t"] = true, -- Use "t" for HTML-style mappings
        },
        aliases = {
            ["a"] = ">", -- Single character aliases apply everywhere
            ["b"] = ")",
            ["B"] = "}",
            ["r"] = "]",
            -- Table aliases only apply for changes/deletions
            ["q"] = { '"', "'", "`" }, -- Any quote character
            ["s"] = { ")", "]", "}", ">", "'", '"', "`" }, -- Any surrounding delimiter
        },
    },
    highlight = { -- Highlight text-objects before surrounding them
        duration = 0,
    }
})
