if defined?(Rails)
  require "civo/engine"
end

require "flexirest"
ENV["CIVO_URL"] ||= "https://api.civo.com"
ENV["CIVO_API_VERSION"] ||= "2"

CIVO_ENGINE_ROOT = File.expand_path("#{File.dirname(__FILE__)}/../")

module Civo
  unless defined?(Rails)
    autoload :Account, "#{CIVO_ENGINE_ROOT}/app/models/civo/account"
    autoload :Action, "#{CIVO_ENGINE_ROOT}/app/models/civo/action"
    autoload :AuditLog, "#{CIVO_ENGINE_ROOT}/app/models/civo/audit_log"
    autoload :Base, "#{CIVO_ENGINE_ROOT}/app/models/civo/base"
    autoload :Charge, "#{CIVO_ENGINE_ROOT}/app/models/civo/charge"
    autoload :DnsDomain, "#{CIVO_ENGINE_ROOT}/app/models/civo/dns_domain"
    autoload :DnsRecord, "#{CIVO_ENGINE_ROOT}/app/models/civo/dns_record"
    autoload :Firewall, "#{CIVO_ENGINE_ROOT}/app/models/civo/firewall"
    autoload :FirewallRule, "#{CIVO_ENGINE_ROOT}/app/models/civo/firewall_rule"
    autoload :Instance, "#{CIVO_ENGINE_ROOT}/app/models/civo/instance"
    autoload :Ip, "#{CIVO_ENGINE_ROOT}/app/models/civo/ip"
    autoload :KPI, "#{CIVO_ENGINE_ROOT}/app/models/civo/kpi"
    autoload :Network, "#{CIVO_ENGINE_ROOT}/app/models/civo/network"
    autoload :Quota, "#{CIVO_ENGINE_ROOT}/app/models/civo/quota"
    autoload :Region, "#{CIVO_ENGINE_ROOT}/app/models/civo/region"
    autoload :Size, "#{CIVO_ENGINE_ROOT}/app/models/civo/size"
    autoload :Snapshot, "#{CIVO_ENGINE_ROOT}/app/models/civo/snapshot"
    autoload :SshKey, "#{CIVO_ENGINE_ROOT}/app/models/civo/ssh_key"
    autoload :System, "#{CIVO_ENGINE_ROOT}/app/models/civo/system"
    autoload :Team, "#{CIVO_ENGINE_ROOT}/app/models/civo/team"
    autoload :Template, "#{CIVO_ENGINE_ROOT}/app/models/civo/template"
    autoload :User, "#{CIVO_ENGINE_ROOT}/app/models/civo/user"
    autoload :Volume, "#{CIVO_ENGINE_ROOT}/app/models/civo/volume"
  end
end
