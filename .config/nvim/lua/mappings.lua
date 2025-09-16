require "nvchad.mappings"

local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD: enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "<leader>od", "<cmd>Nvdash<CR>", { desc = "Open dashboard" })
map("n", "<leader>wq", ":wq<CR>", { desc = "Save & quit" })
map("n", "<leader>qq", ":q!<CR>", { desc = "Quit without saving" })
map("n", "<leader>ww", ":w<CR>", { desc = "Save file" })
map("n", "gx", ":!open <c-r><c-a><CR>", { desc = "Open URL under cursor" })

-- Splits
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", ":close<CR>", { desc = "Close split" })
map("n", "<leader>sj", "<C-w>-", { desc = "Decrease split height" })
map("n", "<leader>sk", "<C-w>+", { desc = "Increase split height" })
map("n", "<leader>sl", "<C-w>>5", { desc = "Increase split width" })
map("n", "<leader>sh", "<C-w><5", { desc = "Decrease split width" })

-- Tabs
map("n", "<leader>to", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
map("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })

-- Diff
map("n", "<leader>cc", ":diffput<CR>", { desc = "Diff: put change" })
map("n", "<leader>cj", ":diffget 1<CR>", { desc = "Diff: get local" })
map("n", "<leader>ck", ":diffget 3<CR>", { desc = "Diff: get remote" })
map("n", "<leader>cn", "]c", { desc = "Diff: next hunk" })
map("n", "<leader>cp", "[c", { desc = "Diff: prev hunk" })

-- Quickfix
map("n", "<leader>qo", ":copen<CR>", { desc = "Quickfix: open" })
map("n", "<leader>qf", ":cfirst<CR>", { desc = "Quickfix: first item" })
map("n", "<leader>qn", ":cnext<CR>", { desc = "Quickfix: next item" })
map("n", "<leader>qp", ":cprev<CR>", { desc = "Quickfix: prev item" })
map("n", "<leader>ql", ":clast<CR>", { desc = "Quickfix: last item" })
map("n", "<leader>qc", ":cclose<CR>", { desc = "Quickfix: close" })

-- Window maximizer
map("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Toggle window maximizer" })

-- File explorer
map("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Explorer: toggle" })
map("n", "<leader>er", ":NvimTreeFocus<CR>", { desc = "Explorer: focus" })
map("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "Explorer: find file" })

-- Telescope
map("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Telescope: find files" })
map("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Telescope: live grep" })
map("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Telescope: find buffers" })
map("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Telescope: help tags" })
map("n", "<leader>fs", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "Telescope: fuzzy find buffer" })
map("n", "<leader>fo", require("telescope.builtin").lsp_document_symbols, { desc = "Telescope: document symbols" })
map("n", "<leader>fi", require("telescope.builtin").lsp_incoming_calls, { desc = "Telescope: incoming calls" })
map("n", "<leader>fm", function() require("telescope.builtin").treesitter({ symbols = { "function", "method" } }) end,
  { desc = "Telescope: methods in class" })
map("n", "<leader>ft", function()
  local success, node = pcall(function() return require("nvim-tree.lib").get_node_at_cursor() end)
  if not success or not node then return end
  require("telescope.builtin").live_grep({ search_dirs = { node.absolute_path } })
end, { desc = "Telescope: grep in current folder" })

-- REST client
map("n", "<leader>xr", ":call VrcQuery()<CR>", { desc = "Run REST query" })

-- LSP
map("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "LSP: hover" })
map("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "LSP: definition" })
map("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "LSP: declaration" })
map("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "LSP: implementation" })
map("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "LSP: type definition" })
map("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "LSP: references" })
map("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "LSP: signature help" })
map("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP: rename symbol" })
map("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { desc = "LSP: format" })
map("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { desc = "LSP: format selection" })
map("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP: code action" })
map("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "LSP: diagnostics float" })
map("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "LSP: prev diagnostic" })
map("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "LSP: next diagnostic" })
map("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { desc = "LSP: document symbols" })
map("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>", { desc = "LSP: trigger completion" })

-- Java-specific mappings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local map = vim.keymap.set
    local opts = { buffer = true, silent = true }

    -- JDTLS
    --map("n", "<leader>rm", function() require("jdtls").run() end, vim.tbl_extend("force", opts, { desc = "Java: run main" }))
    -- map("n", "<leader>rm", function()
    --   require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    --   require('jdtls.dap').setup_dap_main_class_configs()
    --   require('dap').continue()
    -- end, { desc = "Java: run main class", buffer = true })
    vim.keymap.set("n", "<leader>rm", function()
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

    map("n", "<leader>tc", function() require("jdtls").test_class() end,
      vim.tbl_extend("force", opts, { desc = "Java: test class" }))
    map("n", "<leader>tm", function() require("jdtls").test_nearest_method() end,
      vim.tbl_extend("force", opts, { desc = "Java: test method" }))
    map("n", "<leader>io", function() require("jdtls").organize_imports() end,
      vim.tbl_extend("force", opts, { desc = "Java: organize imports" }))

    -- DAP
    map("n", "<leader>dq", "<cmd>Telescope dap configurations<cr>", { desc = "DAP: telescope"})
    map("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", vim.tbl_extend("force", opts, { desc = "DAP: toggle breakpoint" }))
    map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", vim.tbl_extend("force", opts, { desc = "DAP: continue" }))
    map("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", vim.tbl_extend("force", opts, { desc = "DAP: step over" }))
    map("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", vim.tbl_extend("force", opts, { desc = "DAP: step into" }))
    map("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", vim.tbl_extend("force", opts, { desc = "DAP: step out" }))
    map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", vim.tbl_extend("force", opts, { desc = "DAP: repl" }))
    map("n", "<leader>du", function() require("dapui").toggle() end, vim.tbl_extend("force", opts, { desc = "DAP: toggle UI" }))
  end,
})

-- Debugging global
map("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
  { desc = "DAP: conditional breakpoint" })
map("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
  { desc = "DAP: log point" })
map("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "DAP: clear breakpoints" })
map("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "DAP: list breakpoints" })
map("n", "<leader>dd", function() require("dap").disconnect(); require("dapui").close(); end,
  { desc = "DAP: disconnect" })
map("n", "<leader>dt", function() require("dap").terminate(); require("dapui").close(); end,
  { desc = "DAP: terminate" })
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "DAP: run last" })
map("n", "<leader>di", function() require "dap.ui.widgets".hover() end, { desc = "DAP: inspect value" })
map("n", "<leader>d?", function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end,
  { desc = "DAP: scopes" })
map("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "DAP: frames" })
map("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "DAP: commands" })
map("n", "<leader>de", function() require("telescope.builtin").diagnostics({ default_text = ":E:" }) end,
  { desc = "Telescope: diagnostics" })

