local dap = require("dap")
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = "C:\\Program Files\\codelldb-win32-x64\\extension\\adapter\\codelldb.exe",
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    detached = false,
  }
}
dap.configurations.c = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
console = "integratedTerminal",
    program = function()
      return vim.fn.getcwd() .. '\\a.exe'
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
postRunCommands = {'process handle -n false -p true -s false SIGPIPE'},
  },
}

