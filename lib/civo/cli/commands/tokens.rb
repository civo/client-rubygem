command "tokens" do |c|
  tokens = Civo::Token.read_all
  c.action do |args, options|
    if tokens.keys.size > 0
      Civo::Client.tabulate tokens, ["Name", "API Key"]
    else
      puts "No tokens found, please set one using tokens:save"
    end
  end
end

command "tokens:save" do |c|
  c.option "--token TOKEN", String, "Stores the API token"
  c.option "--name NAME", String, "Sets the name for this API token"
  c.action do |args, options|
    Civo::Token.save(options.name, options.token)
  end
end

command "tokens:default" do |c|
  c.example "Sets the default token to 'master'", 'civo tokens:default master'
  c.action do |args, options|
    Civo::Token.set_default(args[0])
  end
end

command "tokens:remove" do |c|
  c.example "Removes the token 'master'", 'civo tokens:remove master'
  c.action do |args, options|
    Civo::Token.remove(args[0])
  end
end
