command "instances" do |c|
  c.description = "List known instances"
  c.action do |args, options|
    begin
      instances = Civo::Instance.all
      Civo::Client.tabulate_flexirest instances, {id: "ID", hostname: "Hostname", size: "Size", ip_addresses: "IP Addresses", status: "Status"}
    rescue Flexirest::HTTPServerException => e
      puts "An error occurred: #{e.result.reason}"
      exit 3
    rescue Flexirest::ResponseParseException => e
      puts "An error occurred: #{e.inspect}"
      exit 4
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end
alias_command "instance", "instances"

command "instances:create" do |c|
  c.description = "Create an instance"
  c.option "--size STRING", String, "The size from 'civo sizes'"
  c.option "--region STRING", String, "The region from 'civo regions'"
  c.option "--ssh-key STRING", String, "The SSH key name from 'civo sshkeys'"
  c.option "--[no-]public-ip", "Should a public IP address be allocated"
  c.option "--template STRING", String, "The template from 'civo templates'"
  c.option "--initial-user STRING", String, "The default user to create (defaults to 'civo')"
  c.example "Creates an instance called 'test1.example.com'", 'civo instances:create test1.example.com --size g1.small --region svg1 --ssh-key default'
  c.action do |args, options|
    begin
      params = {}
      params[:size] = options.size if options.size
      params[:region] = options.region if options.region
      params[:ssh_key] = options.ssh_key if options.ssh_key
      params[:public_ip] = options.public_ip if options.public_ip
      params[:template] = options.template if options.template
      params[:initial_user] = options.initial_user if options.initial_user
      params[:hostname] = args.first
      instance = Civo::Instance.create(params)
      puts "Instance '#{args.first}' created.  The ID is '#{instance.id}' and its status is #{instance.status}"
    rescue Flexirest::HTTPServerException => e
      puts "An error occurred: #{e.result.reason}"
      exit 3
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end
alias_command "instance:create", "instances:create"

command "instances:remove" do |c|
  c.description = "Remove an instance by hostname or id"
  c.example "Removes an instance called 'test.example.com'", 'civo instances:remove test.example.com'
  c.action do |args, options|
    begin
      if args.first[/(\w{8}(-\w{4}){3}-\w{12}?)/]
        id = args.first
      else
        instance = Civo::Instance.all.detect {|i| i.hostname == args.first}
        id = instance.id
      end
      instance = Civo::Instance.remove(id: id)
      if instance.result == "ok"
        puts "Instance '#{args.first}' has been removed."
      else
        puts "Failed to delete that instance: #{instance.inspect}"
      end
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    rescue Flexirest::HTTPNotFoundClientException => e
      puts "Couldn't find that account to remove, maybe it's already been removed?"
    rescue Flexirest::HTTPServerException => e
      puts "Unable to remove #{e.result.reason}"
    end
  end
end
alias_command "instance:remove", "instances:remove"
alias_command "instances:delete", "instances:remove"
alias_command "instance:delete", "instances:remove"

command "instances:upgrade" do |c|
  c.description = "Upgrade an instance by hostname or id"
  c.option "--size STRING", String, "The size from 'civo sizes', must be larger than the current size"
  c.example "Upgrades an instance called 'test.example.com' to `g1.large` size", 'civo instances:upgrade test.example.com --size g1.large'
  c.action do |args, options|
    begin
      if args.first[/(\w{8}(-\w{4}){3}-\w{12}?)/]
        id = args.first
      else
        instance = Civo::Instance.all.detect {|i| i.hostname == args.first}
        id = instance.id
      end
      instance = Civo::Instance.upgrade(id: id, size: options.size)
      if instance.result == "ok"
        puts "Instance '#{args.first}' is being upgraded to #{options.size}."
      else
        puts "Failed to upgrade that instance: #{instance.inspect}"
      end
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    rescue Flexirest::HTTPNotFoundClientException => e
      puts "Couldn't find that account to remove, maybe it's already been removed?"
    rescue Flexirest::HTTPServerException => e
      puts "Unable to remove #{e.result.reason}"
    end
  end
end
alias_command "instance:upgrade", "instances:upgrade"
alias_command "instances:resize", "instances:upgrade"
alias_command "instance:resize", "instances:upgrade"

command "instances:reboot" do |c|
  c.description = "Reboot an instance by hostname or id"
  c.example "Reboot an instance called 'test.example.com'", 'civo instances:reboot test.example.com'
  c.action do |args, options|
    begin
      if args.first[/(\w{8}(-\w{4}){3}-\w{12}?)/]
        id = args.first
      else
        instance = Civo::Instance.all.detect {|i| i.hostname == args.first}
        id = instance.id
      end
      instance = Civo::Instance.reboot(id: id)
      if instance.result == "ok"
        puts "Instance '#{args.first}' is being rebooted."
      else
        puts "Failed to reboot that instance: #{instance.inspect}"
      end
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    rescue Flexirest::HTTPNotFoundClientException => e
      puts "Couldn't find that account to remove, maybe it's already been removed?"
    rescue Flexirest::HTTPServerException => e
      puts "Unable to remove #{e.result.reason}"
    end
  end
end
alias_command "instance:reboot", "instances:reboot"
alias_command "instances:restart", "instances:reboot"
alias_command "instance:restart", "instances:reboot"
