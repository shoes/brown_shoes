require "spec_helper"

describe Shoes::App do

  it "should eval a block" do

    apply_mock_app
    apply_mock_window
    apply_mock_flow


    outer = 0
    Shoes::App.new do
      outer = 1
    end
    outer.should == 1
  end

  it "should have a window" do
    apply_mock_app

    mock_window = mock(:window)
    Shoes::Window.should_receive(:new) { mock_window }

    Shoes::App.new
  end

  it "default container should be a flow" do
    apply_mock_app
    apply_mock_window
    apply_mock_flow

    mock_window = mock(:window)
    Shoes::Window.should_receive(:new) { mock_window }

    Shoes::App.new do
      self.should be_a Shoes::Flow
    end
  end

end