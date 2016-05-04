if defined?(Rails)
  require "civo/engine"
  require "flexirest"
end

CIVO_ENGINE_ROOT = File.expand_path("#{File.dirname(__FILE__)}/../")

module Civo
  unless defined?(Rails)
    autoload :Account, "#{CIVO_ENGINE_ROOT}/app/models/civo/account"
    autoload :Action, "#{CIVO_ENGINE_ROOT}/app/models/civo/action"
    autoload :Base, "#{CIVO_ENGINE_ROOT}/app/models/civo/base"
    autoload :SshKey, "#{CIVO_ENGINE_ROOT}/app/models/civo/ssh_key"
    autoload :Quota, "#{CIVO_ENGINE_ROOT}/app/models/civo/quota"
    autoload :Size, "#{CIVO_ENGINE_ROOT}/app/models/civo/size.rb"
    autoload :Region, "#{CIVO_ENGINE_ROOT}/app/models/civo/region"
    autoload :Template, "#{CIVO_ENGINE_ROOT}/app/models/civo/template"
    autoload :Snapshot, "#{CIVO_ENGINE_ROOT}/app/models/civo/snapshot"
    autoload :Firewall, "#{CIVO_ENGINE_ROOT}/app/models/civo/firewall"
    autoload :FirewallRule, "#{CIVO_ENGINE_ROOT}/app/models/civo/firewall_rule"
    autoload :Instance, "#{CIVO_ENGINE_ROOT}/app/models/civo/instance"
    autoload :Ip, "#{CIVO_ENGINE_ROOT}/app/models/civo/ip"
  end
end
