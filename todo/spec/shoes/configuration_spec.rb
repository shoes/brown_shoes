require "spec_helper"

require 'shoes/configuration'

describe Shoes::Configuration do

  it "should keep a framework" do
    Shoes::Configuration.framework = 'abc'
    Shoes::Configuration.framework.should == 'abc'
  end
end