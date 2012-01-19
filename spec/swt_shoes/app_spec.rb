require "spec_helper"
require "swt_shoes/spec_helper"

describe SwtShoes::App do

  describe "WhiteShoes requirements" do
    let(:shell) { mock(:swt_shell,
                       :setSize => true, :setText => true, :addListener => true) }
    before do
      Swt::Widgets::Shell.stub(:new) { shell }
    end

    it_behaves_like "A WhiteShoes Shoes::App"
  end

  #describe "gui_init" do
  #  it "create a Shell" do
  #    shell = mock(:swt_shell,
  #                 :setSize => true, :setText => true, :addListener => true)
  #    Swt::Widgets::Shell.stub(:new) { shell }
  #
  #    mock_window = mock(:window)
  #    Shoes::Window.should_receive(:new) { mock_window }
  #
  #    Shoes::App.new
  #  end
  #end


end