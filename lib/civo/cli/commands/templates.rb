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
alias_command "template", "templates"

if Civo::Config.admin?
  command "templates:create" do |c|
    c.description = "Create a template (the ID should be all lower-case, hyphens and full stops)"
    c.option "--name STRING", String, "The name of the template"
    c.option "--image-id STRING", String, "The Openstack Image ID"
    c.option "--short-description STRING", String, "A short (one-line) description of this template"
    c.option "--description STRING", String, "A longer (Markdown format) description of this template"
    c.option "--cloud-init-file STRING", String, "The filename of a cloud init file"
    c.example "Creates a template with the ID 'ubuntu-apache' with a cloud init file called 'my-cloud-config'", 'civo template:create ubuntu-apache --image-id 12345-67890-12345 --cloud-init-file=my-cloud-config'
    c.action do |args, options|
      params = {
        id: args[0]
      }
      params[:name] = options.name if options.name
      params[:image_id] = options.image_id if options.image_id
      params[:short_description] = options.short_description if options.short_description
      params[:description] = options.description if options.description
      if options.cloud_init_file
        cloud_init_file = File.expand_path(options.cloud_init_file)
        params[:cloud_config] = File.read(cloud_init_file) if File.exist?(cloud_init_file)
      end
      begin
        Civo::Template.create(params)
        puts "Template '#{args.first}' updated."
      rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
        puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
      end
    end
  end
  alias_command "template:create", "templates:create"
  alias_command "template:new", "templates:create"
  alias_command "templates:new", "templates:create"

  command "templates:update" do |c|
    c.description = "Update a template"
    c.option "--name STRING", String, "The name of the template"
    c.option "--image-id STRING", String, "The Openstack Image ID"
    c.option "--short-description STRING", String, "A short (one-line) description of this template"
    c.option "--description STRING", String, "A longer (Markdown format) description of this template"
    c.option "--cloud-init-file STRING", String, "The filename of a cloud init file"
    c.example "Updates a template with the ID 'ubuntu-apache' with a cloud init file called 'my-cloud-config'", 'civo template:update ubuntu-apache --cloud-init-file=my-cloud-config'
    c.action do |args, options|
      params = {
        id: args[0]
      }
      params[:name] = options.name if options.name
      params[:image_id] = options.image_id if options.image_id
      params[:short_description] = options.short_description if options.short_description
      params[:description] = options.description if options.description
      if options.cloud_init_file
        cloud_init_file = File.expand_path(options.cloud_init_file)
        params[:cloud_config] = File.read(cloud_init_file) if File.exist?(cloud_init_file)
      end
      begin
        Civo::Template.save(params)
        puts "Template '#{args.first}' updated."
      rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
        puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
      end
    end
  end
  alias_command "template:update", "templates:update"
  alias_command "template:save", "templates:update"
  alias_command "templates:save", "templates:update"
end
