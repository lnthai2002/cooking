$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cooking/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cooking"
  s.version     = Cooking::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Cooking."
  s.description = "TODO: Description of Cooking."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.13"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "mysql2"
end
