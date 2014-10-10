module ConstantCache
  if defined? Rails::Railtie
    require 'rails'
    class Railtie < Rails::Railtie

      initializer 'constant_cache railtie initialization' do
        ActiveRecord::Base.send(:extend, ConstantCache::CacheMethods::ClassMethods)
        ActiveRecord::Base.send(:include, ConstantCache::CacheMethods::InstanceMethods)
      end
    end
  end

end
