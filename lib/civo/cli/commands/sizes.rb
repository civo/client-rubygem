command "sizes" do |c|
  c.description = "List available instance sizes"
  c.action do |args, options|
    begin
      sizes = Civo::Size.all
      Civo::Client.tabulate_flexirest sizes, {Name: "Size", Description: "Description"}
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end
# alias_command "sizes", "size"

command "sizes:reset" do |c|
  c.description = "Reset available instance sizes"
  c.action do |args, options|
    begin
      Civo::Size.reset
      puts "Standard sizes reset in Openstack"
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end

alias_command "size:reset", "sizes:reset"
