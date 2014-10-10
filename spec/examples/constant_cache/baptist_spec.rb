describe 'ConstantCache::Baptist' do

  context '#resolve_constant_name' do

    # CamelCase => CAMEL_CASE
    it 'should upcase its characters and separate CamelCased strings' do
      expect(ConstantCache::Baptist.resolve_constant_name('TestCase')).to eq('TEST_CASE')
    end



    ####### LEGACY
    it 'should upcase its characters' do
      expect(ConstantCache::Baptist.resolve_constant_name('test')).to eq('TEST')
    end

    it 'should replace whitespace with a single underscore' do
      expect(ConstantCache::Baptist.resolve_constant_name("test this \tformat\nplease.")).to eq('TEST_THIS_FORMAT_PLEASE')
    end

    it 'should remove leading and trailing whitespace' do
      expect(ConstantCache::Baptist.resolve_constant_name(' test ')).to eq('TEST')
    end

    it 'should remove non-word characters' do
      expect(ConstantCache::Baptist.resolve_constant_name('!test?')).to eq('TEST')
    end

    it 'should not singularize plural name' do
      expect(ConstantCache::Baptist.resolve_constant_name('tests')).to eq('TESTS')
    end

    it 'should return nil when all characters are removed' do
      expect(ConstantCache::Baptist.resolve_constant_name('?')).to be_nil
    end

    it 'should collapse multiple underscores' do
      expect(ConstantCache::Baptist.resolve_constant_name('test__me')).to eq('TEST_ME')
    end

  end


end
