require File.dirname(__FILE__) + '/../../spec_helper'

describe SimpleClass, 'with constant_cache mix-in' do
  include NullDB::RSpec::NullifiedDatabase

  before { @value = 'pony' }

  it 'should set some default options' do
    enable_caching(SimpleClass)
    expect(SimpleClass.cache_options).to eq(key: :name, limit: 64)
  end

  it 'should overwrite default options when passed new ones' do
    additional_options = { key: :new_key, limit: 100 }

    enable_caching(SimpleClass, [], additional_options)
    expect(SimpleClass.cache_options).to eq(additional_options)
  end

  it 'should use name as the default constant key' do
    enable_caching(SimpleClass, [{ name: 'one', value: @value }])
    expect(SimpleClass::ONE.value).to eq(@value)
  end

  it 'should not set constant when value is nil' do
    proc = lambda { enable_caching(SimpleClass, [{ name: '?', value: @pony }]) }
    expect(proc).not_to change(SimpleClass.constants, :size)
  end

  it 'should raise an exception with message when encountering a duplicate constant' do
    proc = lambda { enable_caching(SimpleClass, [{ name: 'duplicate' }, { name: 'duplicate' }]) }
    expect(proc).to raise_error(ConstantCache::DuplicateConstantError, 'Constant SimpleClass::DUPLICATE has already been defined')
  end

  it 'should truncate long constant names' do
    enable_caching(SimpleClass, [{ name: 'a' * 65, value: @value }])
    expect(SimpleClass.const_get('A' * 64).value).to eq(@value)
  end

  it 'should honor configuration of truncation point' do
    enable_caching(SimpleClass, [{ name: 'abcdef', value: @value }], limit: 3)
    expect(SimpleClass::ABC.value).to eq(@value)
  end

  it 'should raise an exception when truncated constant names collide' do
    proc = lambda { enable_caching(SimpleClass, [{ name: 'abcd' }, { name: 'abef' }], limit: 2) }
    expect(proc).to raise_error(ConstantCache::DuplicateConstantError)
  end

  it 'should raise an exception when an invalid limit is set' do
    limit = 0
    proc = lambda { SimpleClass.caches_constants(limit: limit) }
    expect(proc).to raise_error(ConstantCache::InvalidLimitError, "Limit of #{limit} is invalid")
  end
end

describe AlternateClass, 'with constant_cache mix-in' do

  it 'should allow override of key' do
    enable_caching(AlternateClass, [{ name2: 'foo bar', value: @value }], key: :name2)
    expect(AlternateClass::FOO_BAR.value).to eq(@value)
  end

end
