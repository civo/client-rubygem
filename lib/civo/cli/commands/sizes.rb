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
