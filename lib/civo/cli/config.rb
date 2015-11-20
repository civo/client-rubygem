module Civo
  class Config
    FILENAME = "#{ENV["HOME"]}/.civorc"

    def self.header_line
      "# This file is managed by 'civo'\n"
    end

    def self.ensure_file_exists!
      unless File.exists?(FILENAME)
        update({meta: {version: "1", url: "https://api.civo.com"}}).save
        FileUtils.chmod(0600, FILENAME)
      end

      unless File.exists?(FILENAME)
        puts "#{FILENAME} doesn't exist and couldn't be created"
        exit 1
      end

      unless ("%o" % File.stat(FILENAME).mode).to_s[/600$/]
        puts "The permissions on #{FILENAME} aren't 0600 (#{ ("%o" % File.stat(FILENAME).mode).to_s}), they must be for security reasons"
        exit 2
      end
    end

    def self.parse
      ensure_file_exists!

      @config = TOML.load_file(FILENAME)
    end

    def self.api_url
      parse["meta"]["url"]
    end

    def self.update(config)
      @config = config
      self
    end

    def self.save
      File.open(FILENAME, "w") do |f|
        f << header_line
        f << TOML::Generator.new(@config).body
      end
    end

  end
end
