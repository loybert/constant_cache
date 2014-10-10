require 'test_helper'

class ConstantCacheTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, ConstantCache
  end
end
