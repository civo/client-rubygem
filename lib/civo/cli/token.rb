module Civo
  class Token

    def self.read_all
      config = Civo::Config.parse
      config["tokens"] || {}
    end

    def self.write_all(tokens)
      config = Civo::Config.parse
      config["tokens"] = tokens
      Civo::Config.update(config).save
    end

    def self.save(name, key)
      tokens = read_all
      tokens[name] = key
      if tokens["**DEFAULT**"] == nil
        tokens["**DEFAULT**"] = name
      end
      write_all(tokens)
    end

    def self.set_default(name)
      puts "Setting default token to be #{name}"
      tokens = read_all
      tokens["**DEFAULT**"] = name
      write_all(tokens)
    end

    def self.remove(name)
      tokens = read_all
      tokens.delete(name)
      if tokens["**DEFAULT**"] == name
        tokens["**DEFAULT**"] = tokens.keys.first
        if tokens["**DEFAULT**"] == "**DEFAULT**"
          tokens.delete("**DEFAULT**")
        end
      end
      write_all(tokens)
    end

    def self.default
      tokens = read_all
      token = tokens[tokens["**DEFAULT**"]]
      if token.nil?
        puts "No default token has been set.  Use 'civo tokens:save --name NAME --token TOKEN' to set one"
        exit 2
      end
      token
    end
  end
end
