command "version" do |c|
  c.description = "Display the version of the CLI client"
  c.action do |args, options|
    puts "Civo CLI and Ruby API library v#{Civo::VERSION}"
  end
end
