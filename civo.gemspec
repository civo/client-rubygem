$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "civo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "civo"
  s.version     = Civo::VERSION
  s.authors     = ["Andy Jeffries"]
  s.email       = ["andy@absolutedevops.io"]
  s.homepage    = "http://www.civo.com"
  s.summary     = "Civo CLI AND API"
  s.description = "A command-line client and API access classes for civo.com"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "flexirest", ">= 1.4.6"
  s.add_dependency "toml"
  s.add_dependency "commander"
  s.add_development_dependency "rake"
end
