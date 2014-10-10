require 'rubygems'
require 'rspec'
require 'mocha'

# require 'rspec/rails'

require 'active_support'
require 'active_record'

require 'nulldb_rspec'
include NullDB::RSpec::NullifiedDatabase


lib_dir = File.join(File.dirname(__FILE__), %w(.. lib constant_cache))

Dir.glob("#{lib_dir}/*.rb").each { |file| require file }

# Spec::Runner.configuration.mock_with :mocha
# Spec::Runner.configuration.include ConstantCache::SpecHelper

if false
  RSpec.configure do |c|
    # declare an exclusion filter
    # c.filter_run_excluding :broken => true
    c.filter_run_excluding dev: true
    c.filter_run_excluding outdated: true
    # c.filter_run_excluding slow: true
    # c.filter_run_excluding broken: true
    c.filter_run_excluding dredd: true # TODO: remove after dredd-integration
    c.filter_run_excluding tbd: true

    # filter_run is short-form alias for filter_run_including
    # c.filter_run :focus => true
    # c.filter_run focus: true

    c.infer_spec_type_from_file_location!
  end
end

ActiveRecord::Base.send(:include, ConstantCache::CacheMethods::InstanceMethods)
ActiveRecord::Base.send(:extend, ConstantCache::CacheMethods::ClassMethods)

class BaseClass < ActiveRecord::Base
  def self.columns
    []
  end
end

class SimpleClass < BaseClass
  PREDEFINED = 'foo'
  attr_accessor :name, :value
end

class AlternateClass < BaseClass
  attr_accessor :name2, :value
end
