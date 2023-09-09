local LSP_SERVERS_PATH = vim.fn.stdpath('data') .. "/mason/packages"
local server_path = LSP_SERVERS_PATH .. '/jdtls'
local cache_path = os.getenv('HOME') .. '.cache/jdtls'
local jdk_base = '/usr/lib/jvm'

local LSP = {
  cmd = {
    'jdtls',
    --[[ '-javaagent:' .. server_path .. '/lombok.jar', ]]
    '-javaagent: lombok.jar',
    '-configuration', cache_path .. '/config',
    '-data', cache_path .. '/workspace'
  },
  --[[ filetypes = { "java" }, ]]
  root_dir = require('jdtls.setup').find_root({ 'mvnw', 'gradlew' }),
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-11",
            path = jdk_base .. '/java-11-openjdk'
          },
          {
            name = "JavaSE-17",
            path = jdk_base .. '/java-17-openjdk'
          }
        }
      }
    }
  },
  --[[ init_options = { ]]
  --[[   bundles = { ]]
  --[[     vim.fn.glob(os.getenv('HOME') .. ]]
  --[[       '/.local/dev/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar', 1) ]]
  --[[   } ]]
  --[[ }, ]]
  --[[ on_attach = function () ]]
  --[[   require('jdtls').setup_dap() ]]
  --[[   require('jdtls.dap').setup_dap_main_class_configs() ]]
  --[[ end ]]
}

return LSP
