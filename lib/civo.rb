if defined?(Rails)
  require "civo/engine"
end

module Civo
  autoload :Token, "civo/cli/token"
  autoload :Config, "civo/cli/config"
  autoload :Client, "civo/cli/client"
  unless defined?(Rails)
    autoload :Account, "#{ENGINE_ROOT}/app/models/civo/account"
    autoload :Base, "#{ENGINE_ROOT}/app/models/civo/base"
    autoload :SshKey, "#{ENGINE_ROOT}/app/models/civo/ssh_key"
  end
end
