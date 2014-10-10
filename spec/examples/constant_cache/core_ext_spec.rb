require File.dirname(__FILE__) + '/../../spec_helper'

describe String do
  
  it "should upcase its characters" do
    expect('test'.constant_name).to eq('TEST')
  end
  
  it "should replace whitespace with a single underscore" do
    expect("test this \tformat\nplease.".constant_name).to eq('TEST_THIS_FORMAT_PLEASE')
  end
  
  it "should remove leading and trailing whitespace" do
    expect(' test '.constant_name).to eq('TEST')
  end
  
  it "should remove non-word characters" do
    expect('!test?'.constant_name).to eq('TEST')
  end
  
  it "should not singularize plural name" do
    expect('tests'.constant_name).to eq('TESTS')
  end
  
  it "should return nil when all characters are removed" do
    expect('?'.constant_name).to be_nil
  end
  
  it "should collapse multiple underscores" do
    expect('test__me'.constant_name).to eq('TEST_ME')
  end
  
end
