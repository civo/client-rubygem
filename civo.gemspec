$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "civo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "civo"
  s.version     = Civo::VERSION
  s.authors     = ["Andy Jeffries"]
  s.email       = ["andy@andyjeffries.co.uk"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Civo."
  s.description = "TODO: Description of Civo."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
