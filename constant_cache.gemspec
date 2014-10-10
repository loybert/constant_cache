$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "constant_cache/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "constant_cache"
  s.version     = ConstantCache::VERSION
  s.authors     = ['Daniel Loy', 'Patrick Reagan']
  s.email       = ['loybert@gmail.com', 'patrick.reagan@viget.com']
  s.homepage    = 'https://github.com/loybert/constant_cache'
  s.summary     = "Patches ActiveRecord::Base to add a caches_constants class method that will cache lookup data for your application."
  s.description = "Patches ActiveRecord::Base to add a caches_constants class method that will cache lookup data for your application."
  s.license     = "MIT"

  # additional spec
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = %w(README MIT-LICENSE HISTORY)

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]



  s.add_dependency "rails", "~> 4.1.6"
  #s.add_dependency('activerecord', '>= 2.0.2')
  #s.add_dependency('activesupport', '>= 2.0.2')




  s.add_development_dependency "sqlite3"
end
