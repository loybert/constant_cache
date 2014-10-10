require 'constant_cache/config'
require 'constant_cache/baptist'
require 'constant_cache/cache_methods'

module ConstantCache
  # load Railtie if Rails exists
  if defined?(Rails)
    require 'constant_cache/railtie'
    # CareBert::Railtie.insert
  end
end