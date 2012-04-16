require_relative './spec_helper'
require 'white_shoes'
require 'shoes/app'

describe Shoes::App do

  describe "initialize" do

    it "should set accessors from constructor args" do
      input_blk = lambda {}
      args = {:args => true}
      Shoes::App.any_instance.stub(:flow)
      app = Shoes::App.new args, &input_blk
      app.should respond_to :width
      app.should respond_to :height
      app.should respond_to :title
      #app.blk.should == input_blk
    end

    it "should set default accessor values" do
      input_blk = lambda {}
      args = {}
      Shoes::App.any_instance.stub(:flow)
      app = Shoes::App.new args, &input_blk
      app.width.should_not be_nil
      app.height.should_not be_nil
      app.title.should_not be_nil
    end
    it "should set accessors from opts" do
      input_blk = lambda {}
      args = {:width => 1, :height => 2, :title => "Shoes::App Spec"}
      Shoes::App.any_instance.stub(:flow)
      app = Shoes::App.new args, &input_blk
      app.width.should == 1
      app.height.should == 2
      app.title.should == "Shoes::App Spec"

    end
  end


end
