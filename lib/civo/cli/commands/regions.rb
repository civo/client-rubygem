command "regions" do |c|
  c.description = "List available regions"
  c.action do |args, options|
    begin
      regions = Civo::Region.all
      puts "Region name"
      puts "-" * 72
      regions.each do |region|
        puts region.name
      end
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end
alias_command "region", "regions"
