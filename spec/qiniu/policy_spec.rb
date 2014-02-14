require 'spec_helper'

describe Qiniu::Policy do

  it 'should have a version number' do
    Qiniu::Policy::VERSION.should_not be_nil
  end

  it 'version should be number' do
    Qiniu::Policy::VERSION.to_s.should =~ /^\d+\.\d+\.\d+?$/
  end

end
