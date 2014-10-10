module ConstantCache
  if defined? Rails::Railtie
    require 'rails'
    class Railtie < Rails::Railtie

      initializer "my_railtie.configure_rails_initialization" do
        # some initialization behavior
        ActiveRecord::Base.send(:extend, ConstantCache::CacheMethods::ClassMethods)
        ActiveRecord::Base.send(:include, ConstantCache::CacheMethods::InstanceMethods)
      end

      rake_tasks do
        #load 'tasks/care_bert_tasks.rake'
      end

    end
  end

  # class Railtie
  # def self.insert
  #---
  # end
  # end
end
