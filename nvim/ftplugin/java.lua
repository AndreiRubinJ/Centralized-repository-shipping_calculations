local jdtls = require("jdtls")
local mason_path = vim.fn.stdpath("data") .. "/mason"
local jdtls_cmd = mason_path .. "/bin/jdtls"
local bundles = {}
local java_debug = vim.fn.glob(mason_path .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar")
if java_debug ~= "" then
  table.insert(bundles, java_debug)
end
local java_test = vim.fn.glob(mason_path .. "/packages/java-test/extension/server/*.jar")
if java_test ~= "" then
  vim.list_extend(bundles, vim.split(java_test, "\n"))
end

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = jdtls.setup.find_root(root_markers)
if not root_dir then
  return
end

local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
  cmd = { jdtls_cmd, "-data", workspace_dir },
  root_dir = root_dir,
  init_options = { bundles = bundles },
  settings = {
    java = {
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
    },
  },
  on_attach = function(_, bufnr)
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
    end
    map("gd", vim.lsp.buf.definition, "Go to Definition")
    map("gr", vim.lsp.buf.references, "Find References")
    map("gi", vim.lsp.buf.implementation, "Go to Implementation")
    map("<leader>rn", vim.lsp.buf.rename, "Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("<leader>jo", jdtls.organize_imports, "Organize Imports")
    map("<leader>jc", jdtls.compile, "Compile Project")
    map("<leader>jt", jdtls.test_class, "Run Tests (Class)")
    map("<leader>jn", jdtls.test_nearest_method, "Run Test (Nearest)")
    map("<leader>jr", function()
      require("jdtls.dap").setup_dap_main_class_configs()
      require("dap").continue()
    end, "Run Main Class")
  end,
}

jdtls.start_or_attach(config)
jdtls.setup_dap({ hotcodereplace = "auto" })
