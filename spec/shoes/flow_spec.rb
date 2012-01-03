require "spec_helper"

describe Shoes::Flow do
  let(:display) { SWT::Widgets::Display.getDefault }
  let(:shell) { SWT::Widgets::Shell.new(display) }

  it "should have a SWT Composite" do
    flow = Shoes::Flow.new(shell)
    flow.swt_composite.should be_a SWT::Layouts::Composite
  end

  it "should horizontally stack 3 widgets" do
    button1 = button2 = button3 = nil
    Shoes::Flow.new(shell) do
      button1 = button("Button1")
      button2 = button("Button2")
      button3 = button("Button3")
    end
    button1.left.should >= 0
    button2.left.should >= button1.left + button1.width
  end

  it "should have a margin" do
    button1 = nil
    Shoes::Flow.new(shell, :margin => 10) do
      button1 = button("Button1")
    end
    button1.top.should == 10
    button1.left.should == 10

  end

end