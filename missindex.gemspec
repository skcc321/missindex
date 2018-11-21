$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "missindex/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "missindex"
  s.version     = Missindex::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = "https://github.com/skcc321"
  s.summary     = "recreate indexes"
  s.description = "recreates indexes"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "sqlite3"
end
