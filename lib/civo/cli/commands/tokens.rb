command "tokens" do |c|
  c.description = "List the tokens you have saved"
  c.action do |args, options|
    tokens = Civo::Token.read_all
    if tokens.keys.size > 0
      Civo::Client.tabulate tokens, ["Name", "API Key"]
    else
      puts "No tokens found, please set one using tokens:save"
    end
  end
end
alias_command "token", "tokens"

command "tokens:save" do |c|
  c.description = "Save an API token supplied by Civo.com"
  c.example "Saves a token called 'master' with API key 'key_goes_here'", 'civo tokens:save master key_goes_here'
  c.action do |args, options|
    Civo::Token.save(args[0], args[1])
  end
end
alias_command "token:save", "tokens:save"

command "tokens:default" do |c|
  c.description = "Set the default token from the list you have saved"
  c.example "Sets the default token to 'master'", 'civo tokens:default master'
  c.action do |args, options|
    Civo::Token.set_default(args[0])
  end
end
alias_command "tokens:use", "tokens:default"
alias_command "token:use", "tokens:default"
alias_command "token:default", "tokens:default"

command "tokens:remove" do |c|
  c.description = "Remove a token from the list you have saved"
  c.example "Removes the token 'master'", 'civo tokens:remove master'
  c.action do |args, options|
    Civo::Token.remove(args[0])
  end
end
alias_command "token:remove", "tokens:remove"
