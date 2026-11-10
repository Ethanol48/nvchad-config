local ls = require("luasnip")
local s, f, i = ls.snippet, ls.function_node, ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

-- foo_bar.h -> FOO_BAR_H
local function guard()
  local name = vim.fn.expand("%:t"):upper():gsub("[^%w]", "_")
  return name
end

return {
  s({ trig = "#guard", name = "header guard", dscr = "Guard con el nombre del archivo" }, fmta([[
#ifndef <name>
#define <name>

<body>

#endif // <name>
]], {
    name = f(guard),
    body = i(0),
  }, { repeat_duplicates = true })),
}
