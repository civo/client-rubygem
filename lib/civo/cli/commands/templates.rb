command "templates" do |c|
  c.description = "List available instance templates"
  c.action do |args, options|
    begin
      templates = Civo::Template.all
      data = {}
      templates.each do |template|
        data[template.id] = template.short_description
      end
      Civo::Client.tabulate data, ["Template", "Description"]
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end
