require 'spec_helper'

describe "Shoes" do
  let(:mock_window) { mock(:window) }
  let(:mock_display) { mock(:display, :dispose => true) }
  before do
    SwtDisplay.stub!(:new) { mock_display }
    mock_display.stub!(:shells) { [] }
  end

  describe "as a simple App" do
    it "should have a window" do
      Shoes::Window.should_receive(:new).and_return(mock_window)

      Shoes.app {}
    end
    it "should pass opts to the main window" do
      Shoes::Window.should_receive(:new).
          with(:title => "Spec Title",
               :width => 200, :height => 200,
               :resizable => false).
          and_return(mock_window)

      Shoes.app(:title => "Spec Title",
                :width => 200, :height => 200,
                :resizable => false) {}
    end
  end
end
