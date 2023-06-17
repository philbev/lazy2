--   ___ ___  _ __ ___  _ __ | | ___| |_(_) ___  _ __   | |_   _  __ _ 
--  / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \  | | | | |/ _` |
-- | (_| (_) | | | | | | |_) | |  __/ |_| | (_) | | | |_| | |_| | (_| |
--  \___\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_(_)_|\__,_|\__,_|
--                     |_|                                             

-- ~/.config/nvim/lua/setup/completion.lua

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local status_ok,luasnip = pcall(require, 'luasnip')
if not status_ok then
    return
end

local snips_ok, friendly = pcall(require, 'luasnip.loaders.from_vscode')
if not snips_ok then
    return
end

friendly.lazy_load()

local is_ok,cmp = pcall(require, 'cmp')
if not is_ok then
    return
end

local kind_icons = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'fish' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'dictionary', keyword_length = 4 },
        }),
    formatting = {
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            -- Source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[Lsp]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Api]",
                dictionary = '[Dict]',
                path = '[Path]',
                latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return vim_item
        end
    },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' },
	}, {
		{ name = 'buffer' },
		{ name = 'dictionary', keyword_length = 5 },
		{ name = 'path' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

local dict = require("cmp_dictionary")

dict.setup({
  -- The following are default values.
  exact = 2,
  first_case_insensitive = false,
  document = false,
  document_command = "wn %s -over",
  async = false,
  max_items = -1,
  capacity = 5,
  debug = false,
})

dict.switcher({
  filetype = {
    lua = "/path/to/lua.dict",
    javascript = { "/path/to/js.dict", "/path/to/js2.dict" },
  },
  filepath = {
    [".*xmake.lua"] = { "/path/to/xmake.dict", "/path/to/lua.dict" },
    ["%.tmux.*%.conf"] = { "/path/to/js.dict", "/path/to/js2.dict" },
  },
  spelllang = {
    en = "/usr/share/dict/words",
  },
})
