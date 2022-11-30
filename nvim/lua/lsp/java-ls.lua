local server_path = LSP_SERVERS_PATH .. '/jdtls'
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace = os.getenv('HOME') .. '/lab/.java_workspace'
local jdk_base = '/usr/lib/jvm'
local jdk_17 = '/java-17-openjdk-17.0.5.0.8-1.fc37.x86_64'
local jdk_11 = '/java-11-openjdk-11.0.17.0.8-1.fc37.x86_64'
local jdk_8 = '/java-1.8.0-openjdk-1.8.0.352.b08-2.fc37.x86_64'
local M = {}

function M.setup()
  
  local config = {
    cmd = {
      'java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      '-jar', server_path .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
      '-configuration', server_path .. "/config_linux",
      '-data', workspace
    },
    filetypes = {"java"},
    root_dir = require('jdtls.setup').find_root({'mvnw', 'gradlew'}),
    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = "JavaSE-11",
              path = jdk_base .. jdk_11
            },
            {
              name = "JavaSE-17",
              path = jdk_base .. jdk_17
            }
          }
        }
      }
    },
    init_options = {
      bundles = {}
    },
  }

  require('jdtls').start_or_attach(config)
end

return M

