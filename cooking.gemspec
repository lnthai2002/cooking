$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cooking/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cooking"
  s.version     = Cooking::VERSION
  s.authors     = ["Nhut Thai Le"]
  s.email       = ["lnthai2002@yahoo.com"]
  s.homepage    = "http://darkportal.no-ip.info/pas/cooking"
  s.summary     = "Record cooking recipes"
  s.description = "Record cooking recipes"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.1"
  s.add_dependency 'mysql2'
  s.add_dependency 'mini_magick'
  s.add_dependency 'carrierwave'
  s.add_dependency 'tabs_on_rails'
  s.add_dependency 'foundation-rails'     #foundation UI framework
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'remotipart'
  s.add_dependency 'dynamic_form'

  s.add_dependency 'haml-rails'
  s.add_development_dependency 'rspec-rails'
  #s.add_development_dependency 'capybara'                    #not used yet
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'rails_layout' #generate template for foundation/bootstrap

  s.test_files = Dir["spec/**/*"]
end
