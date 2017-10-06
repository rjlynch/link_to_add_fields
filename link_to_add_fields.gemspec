$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "link_to_add_fields/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "link_to_add_fields"
  s.version     = LinkToAddFields::VERSION
  s.authors     = ["richard lynch"]
  s.email       = ["rjlynch86@googlemail.com"]
  s.homepage    = "https://github.com/rjlynch"
  s.license     = "MIT"
  s.summary     = "Dynamically add nested fields to your Rails forms."
  s.description = <<-TEXT
When clicked, `link_to_add_fields` will render the association's fields partial 
above it.
`link_to_remove_fields` will hide the HTML element matching it's target css 
selector. It also sets a truthy value in the hidden input field closest to it.
  TEXT

  s.files = Dir["{app,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.required_ruby_version = ">= 2.0"

  s.add_dependency "rails", ">= 3.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
end
