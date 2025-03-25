if defined?(Rails)
  require "civo/engine"
end

require "flexirest"
ENV["CIVO_URL"] ||= "https://api.civo.com"
ENV["CIVO_API_VERSION"] ||= "2"

CIVO_ENGINE_ROOT = File.expand_path("#{File.dirname(__FILE__)}/../")

require_relative "../app/models/civo/base"
require_relative "../app/models/civo/account"
require_relative "../app/models/civo/action"
require_relative "../app/models/civo/application"
require_relative "../app/models/civo/audit_log"
require_relative "../app/models/civo/auth"
require_relative "../app/models/civo/blueprint"
require_relative "../app/models/civo/charge"
require_relative "../app/models/civo/database"
require_relative "../app/models/civo/disk_image"
require_relative "../app/models/civo/dns_domain"
require_relative "../app/models/civo/dns_record"
require_relative "../app/models/civo/firewall"
require_relative "../app/models/civo/firewall_rule"
require_relative "../app/models/civo/instance"
require_relative "../app/models/civo/kfclusters"
require_relative "../app/models/civo/kubernetes"
require_relative "../app/models/civo/ip"
require_relative "../app/models/civo/kpi"
require_relative "../app/models/civo/load_balancer"
require_relative "../app/models/civo/network"
require_relative "../app/models/civo/object_store"
require_relative "../app/models/civo/object_store_credential"
require_relative "../app/models/civo/organisation"
require_relative "../app/models/civo/quota"
require_relative "../app/models/civo/region"
require_relative "../app/models/civo/reserved_ip"
require_relative "../app/models/civo/role"
require_relative "../app/models/civo/size"
require_relative "../app/models/civo/snapshot"
require_relative "../app/models/civo/ssh_key"
require_relative "../app/models/civo/subnet"
require_relative "../app/models/civo/system"
require_relative "../app/models/civo/team"
require_relative "../app/models/civo/team_member"
require_relative "../app/models/civo/template"
require_relative "../app/models/civo/user"
require_relative "../app/models/civo/volume"
require_relative "../app/models/civo/volume_type"
