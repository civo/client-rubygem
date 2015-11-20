command "accounts" do |c|
  c.description = "List known accounts (CIVO-INTERNAL-USE ONLY)"
  c.action do |args, options|
    begin
      accounts = Civo::Account.all
      data = {}
      accounts.each do |account|
        data[account.username] = account.api_key
      end
      Civo::Client.tabulate data, ["Account", "API Key"]
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end

command "accounts:create" do |c|
  c.description = "Create an account (CIVO-INTERNAL-USE ONLY)"
  c.example "Creates an account called 'testuser'", 'civo accounts:create testuser'
  c.action do |args, options|
    begin
      account = Civo::Account.create(name: args.first)
      puts "Account '#{args.first}' created.  The API key is '#{account.api_key}'"
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end

command "accounts:reset" do |c|
  c.description = "Reset the API Key for an account (CIVO-INTERNAL-USE ONLY)"
  c.example "Resets the account called 'testuser' with a new API key", 'civo accounts:reset testuser'
  c.action do |args, options|
    begin
      account = Civo::Account.reset(name: args.first)
      puts "Account '#{args.first}' reset, the new API key is '#{account.api_key}'"
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    end
  end
end

command "accounts:remove" do |c|
  c.description = "Remove an account (and all instances, networks, etc) (CIVO-INTERNAL-USE ONLY)"
  c.example "Removes an account called 'testuser'", 'civo accounts:remove testuser'
  c.action do |args, options|
    begin
      account = Civo::Account.remove(name: args.first)
      if account.result == "ok"
        puts "Account '#{args.first}' has been removed."
      else
        puts "Failed to delete that account: #{account.inspect}"
      end
    rescue Flexirest::HTTPUnauthorisedClientException, Flexirest::HTTPForbiddenClientException
      puts "Access denied to your default token, ensure it's set correctly with 'civo tokens'"
    rescue Flexirest::HTTPNotFoundClientException => e
      puts "Couldn't find that account to remove, maybe it's already been removed?"
    rescue Flexirest::HTTPServerException => e
      puts "Unable to remove #{e.result.reason}"
    end
  end
end
