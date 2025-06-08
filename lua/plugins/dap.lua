return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      local dap = require("dap")
      dap.adapters.codelldb = {
        type = 'server',
        port = "6543",
        executable = {
          -- Change this to your path!
          command = vim.fn.expand("~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"), -- Correct Path
          args = { "--port", "6543" },
        }
      }

      dap.configurations.rust = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false
        },
      }

      local dapui = require("dapui")
      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
    end,
    keys = {
      { "<F5>",       function() require("dap").continue() end,                                             desc = "Start/Continue Debugging" },
      { "<F10>",      function() require("dap").step_over() end,                                            desc = "Step Over" },
      { "<F11>",      function() require("dap").step_into() end,                                            desc = "Step Into" },
      { "<F12>",      function() require("dap").step_out() end,                                             desc = "Step Out" },
      { "<Leader>b",  function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
      { "<Leader>B",  function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Set Conditional Breakpoint" },
      { "<Leader>dr", function() require("dap").repl.open() end,                                            desc = "Open Debug REPL" },
      { "<Leader>du", function() require("dapui").toggle() end,                                             desc = "Toggle DAP UI" },
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
  }
}
