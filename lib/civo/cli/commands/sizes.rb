command "sizes" do |c|
  c.description = "List available instance sizes"
  c.action do |args, options|
    begin
      sizes = Civo::Size.all
      data = {}
      sizes.each do |size|
        data[size.Name] = size.Description
      end
      Civo::Client.tabulate data, ["Size", "Description"]
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end
