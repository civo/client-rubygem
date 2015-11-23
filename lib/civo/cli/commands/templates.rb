command "templates" do |c|
  c.description = "List available instance templates"
  c.action do |args, options|
    begin
      templates = Civo::Template.all
      Civo::Client.tabulate_flexirest templates, {id: "Template", short_description: "Description"}
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end
