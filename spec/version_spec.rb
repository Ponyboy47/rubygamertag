require 'spec_helper'

describe RubyGamertag do
  it "should be the correct version" do
    RubyGamertag::VERSION.should == '0.4.0'
  end
end
