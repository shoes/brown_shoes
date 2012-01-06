require "spec_brown_helper"
import javax.swing.JPanel
import javax.swing.border.EmptyBorder

describe Shoes::Flow do

  let(:parent_container) { JPanel.new }

  it "should have a container as JPanel" do
    flow = Shoes::Flow.new(parent_container)
    flow.parent_container.should == parent_container
    flow.container.should be_a JPanel
    flow.container.should_not === flow.parent_container
  end

  it "should horizontally stack 3 widgets" do
    button1 = button2 = button3 = nil
    tflow = Shoes::Flow.new(parent_container) do
      button1 = button("Button1")
      button2 = button("Button2")
      button3 = button("Button3")
    end
    debugger
    button1.left.should >= 0
    button2.left.should > 0
    button2.left.should >= button1.left + button1.width
  end

  it "should have a margin" do
    button1 = nil
    flow = Shoes::Flow.new(parent_container, :margin => 10)

    flow.container.border.should be_a EmptyBorder
    flow.container.border.border_insets.left.should == 10
  end

end