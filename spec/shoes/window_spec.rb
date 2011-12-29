require "spec_helper"

describe "Shoes Window" do
  before do
    SwtShell = org.eclipse.swt.widgets.Shell
    $main_display = mock(:display, :shells => [], :dispose => true)
  end

  describe "constructor" do
    it "should create a Swt Shell" do

      mock_shell = mock(:shell, :setSize => true, :setText => true, :open => true)
      SwtShell.should_receive(:new).and_return mock_shell
      Shoes::Window.new
    end
    it "should pass window args to shell" do
      mock_shell = mock(:shell, :open => true)
      SwtShell.should_receive(:new).and_return mock_shell
      mock_shell.should_receive(:setSize).with(1,2)
      mock_shell.should_receive(:setText).with("Spec Window")
      Shoes::Window.new :height => 1, :width => 2, :text => "Spec Window"

    end
  end
end
