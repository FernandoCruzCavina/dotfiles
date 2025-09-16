-- JDTLS (Java LSP) configuration
local home = vim.env.HOME
local jdtls = require("jdtls")

vim.env.JAVA_HOME = "/usr/lib/jvm/java-21-openjdk"
vim.env.PATH = vim.env.JAVA_HOME .. "/bin:" .. vim.env.PATH

local root_dir = require("jdtls.setup").find_root({ "pom.xml", "build.gradle" }) or vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(root_dir, ":t")
local workspace_dir = home .. "/.local/share/jdtls/workspace/" .. project_name
vim.fn.mkdir(workspace_dir, "p")

local java_exe = vim.env.JAVA_HOME .. "/bin/java"
local launcher = vim.fn.glob(home .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")

local system_os = "linux"
if vim.fn.has("mac") == 1 then
  system_os = "mac"
elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  system_os = "win"
end

local bundles = {
  vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", 1), "\n"))

local config = {
  cmd = {
    java_exe,
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/share/jdtls/lombok.jar",
    "-Xmx4g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", launcher,
    "-configuration", home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. system_os,
    "-data", workspace_dir,
  },
  root_dir = root_dir,
  settings = {
    java = {
      home = vim.env.JAVA_HOME,
      eclipse = { downloadSources = true },
      
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          { name = "JavaSE-21", path = vim.env.JAVA_HOME },
        },
      },
      
      maven = { 
        downloadSources = true 
      },
      
      implementationsCodeLens = { 
        enabled = true 
      },
      
      referencesCodeLens = { 
        enabled = true 
      },
      
      references = { 
        includeDecompiledSources = true 
      },
      
      signatureHelp = { 
        enabled = true 
      },
      
      format = { 
        enabled = true 
      },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        importOrder = { 
          "java", 
          "javax", 
          "com", 
          "org" 
        },
      },
      
      sources = { 
        organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 } 
      },

      codeGeneration = { 
        toString = { 
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}" 
        }, 
        useBlocks = true 
      },
    },
  },
  
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  
  flags = { 
    allow_incremental_sync = true 
  },
  
  init_options = { 
    bundles = bundles, 
    extendedClientCapabilities = jdtls.extendedClientCapabilities 
  },
}

config.on_attach = function(client, bufnr)
  jdtls.setup_dap({ hotcodereplace = "auto" })
  require("jdtls.dap").setup_dap_main_class_configs({
    mainClass = function()
      return vim.fn.expand("%:p")
    end,
  })
end

jdtls.start_or_attach(config)
