command "quota" do |c|
  c.option "--account STRING", String, "The account to get the quota for"

  c.description = "List the quota for the current account"
  c.action do |args, options|
    begin
      if options.account
        quota = Civo::Quota.current(username: options.account)
      else
        quota = Civo::Quota.current
      end
      data = {
        "Number of instances" => "#{quota.instance_count_limit} (used #{quota.instance_count_usage})",
        "Total CPU cores" => "#{quota.cpu_core_limit} (used #{quota.cpu_core_usage})",
        "Total RAM" => "#{quota.ram_mb_limit}MB (used #{quota.ram_mb_usage}MB)",
        "Total disk space" => "#{quota.disk_gb_limit}GB (used #{quota.disk_gb_usage}GB)",
        "Disk volumes" => "#{quota.disk_volume_count_limit} (used #{quota.disk_volume_count_usage})",
        "Disk snapshots" => "#{quota.disk_snapshot_count_limit} (used #{quota.disk_snapshot_count_usage})",
        "Public IP addresses" => "#{quota.public_ip_address_limit} (used #{quota.public_ip_address_usage})",
        "Private subnets" => "#{quota.subnet_count_limit} (used #{quota.subnet_count_usage})",
        "Private networks" => "#{quota.network_count_limit} (used #{quota.network_count_usage})",
        "Security groups" => "#{quota.security_group_limit} (used #{quota.security_group_usage})",
        "Security group rules" => "#{quota.security_group_rule_limit} (used #{quota.security_group_rule_usage})",
        "Number of ports (network connections)" => "#{quota.port_count_limit} (used #{quota.port_count_usage})"
      }

      Civo::Client.tabulate data, ["Title", "Limit"]

      if Civo::Config.admin?
        puts
        puts "To set these quota values use:"
        puts "civo quota:set --instance-count #{quota.instance_count_limit} --cpu-core #{quota.cpu_core_limit} --ram-mb #{quota.ram_mb_limit} --disk-gb #{quota.disk_gb_limit} \\"
        puts "  --disk-volume-count #{quota.disk_volume_count_limit} --disk-snapshot-count #{quota.disk_snapshot_count_limit} --public-ip-address #{quota.public_ip_address_limit} \\"
        puts "  --subnet-count #{quota.subnet_count_limit} --network-count #{quota.network_count_limit} --security-group #{quota.security_group_limit} --security-group-rule #{quota.security_group_rule_limit} \\"
        puts "  --port-count #{quota.port_count_limit} #{"--account #{options.account}" if options.account}"
      end
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end

command "quota:set" do |c|
  c.description = "Update the quotas for the current account (CIVO-INTERNAL-USE ONLY)"
  c.option "--account STRING", String, "The account to update the quota for"
  c.option "--instance-count INTEGER", Integer, "The limit to the number of instances available"
  c.option "--cpu-core INTEGER", Integer, "The limit to the number of CPU cores available"
  c.option "--ram-mb INTEGER", Integer, "The limit to the amount of RAM (in MB) available"
  c.option "--disk-gb INTEGER", Integer, "The limit to the of disk space (in GB) available"
  c.option "--disk-volume-count INTEGER", Integer, "The limit to the number of disk volumes available"
  c.option "--disk-snapshot-count INTEGER", Integer, "The limit to the number of disk snapshots available"
  c.option "--public-ip-address INTEGER", Integer, "The limit to the number of public IP addresses available"
  c.option "--subnet-count INTEGER", Integer, "The limit to the number of subnets available"
  c.option "--network-count INTEGER", Integer, "The limit to the number of networks available"
  c.option "--security-group INTEGER", Integer, "The limit to the number of security groups available"
  c.option "--security-group-rule INTEGER", Integer, "The limit to the number of security group rules available"
  c.option "--port-count INTEGER", Integer, "The limit to the number of ports (network connections) available"

  c.action do |args, options|
    begin
      params = {}
      params[:name] = options.account if options.account
      params[:instance_count_limit] = options.instance_count if options.instance_count
      params[:cpu_core_limit] = options.cpu_core if options.cpu_core
      params[:ram_mb_limit] = options.ram_mb if options.ram_mb
      params[:disk_gb_limit] = options.disk_gb if options.disk_gb
      params[:disk_volume_count_limit] = options.disk_volume_count if options.disk_volume_count
      params[:disk_snapshot_count_limit] = options.disk_snapshot_count if options.disk_snapshot_count
      params[:public_ip_address_limit] = options.public_ip_address if options.public_ip_address
      params[:subnet_count_limit] = options.subnet_count if options.subnet_count
      params[:network_count_limit] = options.network_count if options.network_count
      params[:security_group_limit] = options.security_group if options.security_group
      params[:security_group_rule_limit] = options.security_group_rule if options.security_group_rule
      params[:port_count_limit] = options.port_count if options.port_count
      puts params.inspect
      Civo::Quota.update(params)
      puts "Quota updated"
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end
