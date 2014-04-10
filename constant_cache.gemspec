#require './lib/constant_cache/version.rb'

GEM = "constant_cache"
AUTHOR = "Patrick Reagan"
EMAIL = "patrick.reagan@viget.com"
HOMEPAGE = "http://www.viget.com/extend/"
SUMMARY = "Patches ActiveRecord::Base to add a caches_constants class method that will cache lookup data for your application."

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = "0.0.3" #ConstantCache::VERSION::STRING
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = %w(README MIT-LICENSE HISTORY)
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE

  #s.add_dependency('activerecord', '>= 2.0.2')
  #s.add_dependency('activesupport', '>= 2.0.2')

  s.require_path = 'lib'
  s.license      = 'MIT'
  s.files = %w(MIT-LICENSE README  Rakefile HISTORY) + Dir.glob("{lib,spec}/**/*")
end