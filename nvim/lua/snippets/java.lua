local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("java", {
  s("psvm", {
    t("public static void main(String[] args) {"),
    t({ "", "    " }),
    i(1, ""),
    t({ "", "}" }),
  }),
  s("sout", {
    t("System.out.println("),
    i(1, ""),
    t(");"),
  }),
  s("serr", {
    t("System.err.println("),
    i(1, ""),
    t(");"),
  }),
})
