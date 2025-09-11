return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local jdtls = require("jdtls")

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.fn.expand("~/.local/share/nvim/java-workspace/") .. project_name

    local jdtls_path = vim.fn.expand("~/.local/share/jdtls")
    local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

    local config = {
      cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", launcher,
        "-configuration", jdtls_path .. "/config_linux",
        "-data", workspace_dir,
      },
      root_dir = function() return vim.fn.getcwd() end,
      settings = {
        java = {
          project = { referencedLibraries = {} },
          configuration = {
            runtimes = {
              {
                name = "JavaSE-21",
                path = "/usr/lib/jvm/java-21-openjdk",
              },
            },
          },
        },
      },
      init_options = {
        bundles = {},
      },
    }


    jdtls.start_or_attach(config)

    vim.keymap.set("n", "<leader>r", function()
      local filepath = vim.fn.expand("%:p")
      local filename = vim.fn.expand("%:t:r") -- nome da classe
      local ws_folder = vim.fn.expand("~/.local/share/java-temp-workspace/")
      vim.fn.mkdir(ws_folder, "p")

      -- detectar package no topo do arquivo
      local package = ""
      for line in io.lines(filepath) do
        local pkg = line:match("^%s*package%s+([%w_.]+)%s*;")
        if pkg then
          package = pkg
          break
        end
      end

      local full_class_name = package ~= "" and (package .. "." .. filename) or filename

      local term_cmd = table.concat({
        "zsh -c '",
        "setopt nonomatch; ",
        "export JAVA_HOME=/usr/lib/jvm/java-21-openjdk; ",
        "export PATH=$JAVA_HOME/bin:$PATH; ",
        "rm -f " .. ws_folder .. "*.class; ",
        "javac -d " .. ws_folder .. " " .. filepath .. " && ",
        "java -cp " .. ws_folder .. " " .. full_class_name,
        "'"
      }, "")

      vim.cmd("split | terminal " .. term_cmd)
    end, { desc = "Compilar e rodar Java com package" })
  end,
}

