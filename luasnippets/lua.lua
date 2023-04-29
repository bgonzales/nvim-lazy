local ls = require("luasnip")
local snippet = ls.snippet
local text = ls.text_node
local func = ls.function_node
local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local rep = extras.rep

return {
	snippet( {trig = 'localreq'}, fmt( "local {} = require('{}')", { i(1, "default"), rep(1) } )),
	-- snippet({ trig = "date" }, {
	-- 	func(function()
	-- 		return string.format(string.gsub(vim.bo.commentstring, "%%s", " %%s"), os.date())
	-- 	end, {}),
	-- }),
}

