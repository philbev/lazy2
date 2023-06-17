--  _                       _        _             
-- | |_   _  __ _ ___ _ __ (_)_ __  | |_   _  __ _ 
-- | | | | |/ _` / __| '_ \| | '_ \ | | | | |/ _` |
-- | | |_| | (_| \__ \ | | | | |_) || | |_| | (_| |
-- |_|\__,_|\__,_|___/_| |_|_| .__(_)_|\__,_|\__,_|
--                           |_|                   

-- ~/.config/nvim/lua/setup/luasnip.lua

local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	update_events = "TextChanged,TextChangedI",
	-- Snippets aren't automatically removed if their text is deleted.
	-- `delete_check_events` determines on which events (:h events) a check for
	-- deleted snippets is performed.
	-- This can be especially useful when `history` is enabled.
	delete_check_events = "TextChanged",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = true,
	-- mapping for cutting selected text so it's usable as SELECT_DEDENT,
	-- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
	store_selection_keys = "<Tab>",
	-- luasnip uses this function to get the currently active filetype. This
	-- is the (rather uninteresting) default, but it's possible to use
	-- eg. treesitter for getting the current filetype by setting ft_func to
	-- require("luasnip.extras.filetype_functions").from_cursor (requires
	-- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
	-- the current filetype in eg. a markdown-code block or `vim.cmd()`.
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})


vim.cmd([[imap <silent> <C-n> <Plug>luasnip-next-choice]])
vim.cmd([[smap <silent> <C-n> <Plug>luasnip-next-choice]])
vim.cmd([[imap <silent> <C-p> <Plug>luasnip-prev-choice]])
vim.cmd([[smap <silent> <C-p> <Plug>luasnip-prev-choice]])

--------------------------------------------------------
--                   'LUA' SNIPPETS                   --
--------------------------------------------------------
ls.add_snippets('lua', {
    s({trig='#!', dscr='Hash bang'}, fmt([[#! /usr/bin/env lua

 {}]], {i(1)})),

--------------------------------------------------------------------------------
    s({trig='pcall', dscr='Protected call'}, fmt([[local {},{} = pcall({}, '{}')
    if not {} then
   return
   end {}]],
        {i(1, 'status_ok'), i(2, 'NAME'), i(3, 'require'), i(4, 'FUNCTION NAME'), rep(1), i(0)})),
--------------------------------------------------------------------------------

s({trig='map', dscr = 'Vim.keymap.set'}, fmt([[map('{}', '{}', '{}', opts)]],
    {i(1,'n'), i(2, 'LHS'), i(3, 'RHS')}))
})

--------------------------------------------------------
--                   'ALL' SNIPPETS                   --
--------------------------------------------------------
ls.add_snippets("all", {
    s({trig="ternary", dscr="Ternary Operator"}, {
        -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
        i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
    }),

    s('hash', fmt([[#! /usr/bin/env {}

{}]], {c(1,{t('lua'), t('python'), t('bash'), t('fish'), t('zsh')}), i(2)})),

    s({trig='lorem', dscr='Ipsum Lorem Text'}, {
        t({
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi condimentum',
            'consectetur orci, non laoreet tortor varius vitae. Vestibulum feugiat sed libero',
            'id tempus. Nunc non enim et odio imperdiet placerat sed sit amet dolor.',
            'Vestibulum viverra at nisi nec varius. Vestibulum ante ipsum primis in faucibus',
            'orci luctus et ultrices posuere cubilia curae; In hac habitasse platea dictumst.',
            'Mauris non rutrum dui, id pellentesque massa. Etiam congue tempus euismod. Cras',
            'in sollicitudin enim. Vestibulum nec suscipit nunc. Sed sodales est vitae',
            'ultrices ultrices. Nam blandit turpis sit amet magna ornare porttitor. Fusce',
            'semper nisi dolor, vitae volutpat lorem rutrum id. Proin euismod enim in erat',
            'convallis fermentum. Praesent tellus ante, cursus eget dolor sit amet, volutpat',
            'hendrerit lacus. Proin vel felis scelerisque, semper nunc in, fermentum est.',
            '',
            'Nullam hendrerit arcu eros, quis congue elit maximus eget. Suspendisse sed',
            'imperdiet velit, ac varius sem. Donec id sagittis odio, at consequat ligula.',
            'Phasellus hendrerit vitae mi varius tincidunt. Aenean lobortis libero at commodo',
            'rutrum. Sed ante dolor, imperdiet vitae elit ut, facilisis convallis lacus.',
            'Proin at sapien venenatis, dignissim magna et, tempus lectus. Vivamus',
            'ullamcorper enim vitae arcu commodo, ac pharetra lorem placerat. Vivamus eget',
            'volutpat odio. In interdum sapien aliquet, venenatis lorem id, consectetur',
            'augue.',
            '',
            'Suspendisse potenti. Aenean iaculis metus ac interdum eleifend. In hac habitasse',
            'platea dictumst. Pellentesque dignissim tortor molestie sem mattis consequat.',
            'Aenean vitae orci eget turpis vehicula fermentum. Fusce mollis maximus',
            'malesuada. Praesent faucibus feugiat malesuada. Curabitur et consequat risus.',
            'Vestibulum ut mollis turpis, sagittis malesuada ipsum. Mauris bibendum nisi in',
            'lacus volutpat mattis. Nam in consequat nisi, non maximus diam. Proin imperdiet',
            'iaculis odio vitae tempus. Maecenas venenatis porta orci, ut commodo nisl',
            'consectetur mollis. Donec elementum auctor magna vel dictum. Morbi vitae augue',
            'at ipsum rutrum aliquam id vitae arcu. Donec nec ante aliquam, venenatis sapien',
            'ac, commodo ipsum.',
            '',
            'Nam a fermentum ipsum. Sed in ipsum quis nunc elementum mollis vel ac felis.',
            'Donec vitae facilisis risus, non commodo nisl. Integer faucibus sapien a',
            'consequat congue. Phasellus et lobortis est, eu lacinia metus. Cras fringilla',
            'placerat lorem a commodo. Donec imperdiet semper enim, vel pretium erat. Quisque',
            'congue gravida sollicitudin. Orci varius natoque penatibus et magnis dis',
            'parturient montes, nascetur ridiculus mus. Donec tincidunt, turpis eget',
            'venenatis dictum, tellus nunc fermentum nisl, in faucibus augue odio ut erat.',
            'Aliquam at purus sed metus venenatis gravida. Vestibulum ante ipsum primis in',
            'faucibus orci luctus et ultrices posuere cubilia curae; Phasellus sed mi semper,',
            'elementum tellus vitae, congue lacus. Maecenas eget imperdiet sem.',
            '',
            'Morbi rhoncus sed nisi a accumsan. Curabitur scelerisque lorem lorem, vitae',
            'maximus metus scelerisque ac. Maecenas ut tortor nibh. Nullam varius, purus sit',
            'amet congue ultrices, nisi lacus semper neque, suscipit bibendum nibh est sit',
            'amet velit. Nam aliquet tristique libero non congue. Quisque tempus et augue',
            'porttitor consequat. Nullam dignissim placerat urna, ac efficitur ipsum maximus',
            'et. Duis eget lorem ut ante molestie molestie. Nunc quis condimentum dolor.',
            'Curabitur id enim enim. Praesent consequat a diam id elementum. ',

        })
    })
})

--------------------------------------------------------
--                   'TEX' SNIPPETS                   --
--------------------------------------------------------
--ls.add_snippets("tex", {
--    s('ul', fmt([[begin{}
--    \item[{}] {}
--    \end{itemize}]],{i(1, 'itemize'), i(2, 'BULLET'), i(3, 'ITEM')}))
--})
