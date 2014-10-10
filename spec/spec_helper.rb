require 'rubygems'
require 'rspec'
# require 'rspec/rails'

require 'active_support'
require 'active_record'

require 'nulldb_rspec'
include NullDB::RSpec::NullifiedDatabase
#:schema  => 'foo/myschema.rb'

lib_dir = File.join(File.dirname(__FILE__), %w(.. lib constant_cache))

Dir.glob("#{lib_dir}/*.rb").each { |file| require file }

module ConstantCache
  module SpecHelper
    def enable_caching(klass, values = [], additional_options = {})
      return_values = values.empty? ? [] : values.map { |params| klass.new(params) }
      allow(klass).to receive(:all) { return_values }
      klass.caches_constants(additional_options)
    end
  end
end


RSpec.configure do |config|
  config.include ConstantCache::SpecHelper

  # declare an exclusion filter
  # config.filter_run_excluding :broken => true

  # filter_run is short-form alias for filter_run_including
  # config.filter_run :focus => true
  # config.filter_run focus: true
end

# TODO: check for better init
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
