require 'active_support/inflector'

module ConstantCache


  # this module provides constant_names by config
  module Baptist

    #
    # A method to create a constant name from the existing string.  This method condenses
    # multiple non-word characters into a single underscore:
    #
    #   'abc'.constant_name                => 'ABC'
    #   'Restaurants & Bars'.constant_name => 'RESTAURANTS_BARS'
    #

    # @arg string
    def self.resolve_constant_name key
      value = key.underscore.strip.gsub(/\s+/, '_').gsub(/[^\w_]/, '').gsub(/_{2,}/, '_').upcase
      value = nil if value.blank?
      value
    end

  end

end