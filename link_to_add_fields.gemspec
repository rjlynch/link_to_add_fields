$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "link_to_add_fields/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "link_to_add_fields"
  s.version     = LinkToAddFields::VERSION
  s.authors     = ["richard lynch"]
  s.email       = ["rjlynch86@googlemail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of LinkToAddFields."
  s.description = "TODO: Description of LinkToAddFields."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.required_ruby_version = ">= 2.0"

  s.add_dependency "rails", ">= 3.0"
  s.add_dependency 'jquery-rails'

  s.add_development_dependency "sqlite3"
end
