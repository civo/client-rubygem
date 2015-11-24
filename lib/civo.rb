if defined?(Rails)
  require "civo/engine"
  require "flexirest"
end

module Civo
  autoload :Token, "civo/cli/token"
  autoload :Config, "civo/cli/config"
  autoload :Client, "civo/cli/client"
  unless defined?(Rails)
    autoload :Account, "#{ENGINE_ROOT}/app/models/civo/account"
    autoload :Base, "#{ENGINE_ROOT}/app/models/civo/base"
    autoload :SshKey, "#{ENGINE_ROOT}/app/models/civo/ssh_key"
    autoload :Quota, "#{ENGINE_ROOT}/app/models/civo/quota"
    autoload :Size, "#{ENGINE_ROOT}/app/models/civo/size.rb"
    autoload :Region, "#{ENGINE_ROOT}/app/models/civo/region"
    autoload :Template, "#{ENGINE_ROOT}/app/models/civo/template"
    autoload :Instance, "#{ENGINE_ROOT}/app/models/civo/instance"
  end
end
