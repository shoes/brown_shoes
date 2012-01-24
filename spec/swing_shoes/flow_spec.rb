require "spec_helper"

require 'swing_shoes/spec_helper'
import javax.swing.JPanel

describe SwingShoes::Flow do

  class FlowShoeLaces
    include SwingShoes::Flow
    attr_accessor :parent_gui_container, :gui_container, :opts, :width, :height, :margin
  end

  let(:stub_gui_parent) { JPanel.new }
  let(:shoelace) {
    shoelace = FlowShoeLaces.new
    shoelace.parent_gui_container = stub_gui_parent
    shoelace
  }

  describe "WhiteShoes requirements" do

    before do
      subject.parent_gui_container = stub_gui_parent
    end

    it_behaves_like "A WhiteShoes Shoes::Flow"
  end

  it "should have a container and layout" do
    shoelace.gui_flow_init
    shoelace.gui_container.should be_a JPanel
    shoelace.gui_container.get_layout.should be_a java.awt.FlowLayout
  end

  it "should set height and width" do
    mock_container = mock(:jpanel, :set_layout => true)

    #JPanel, once for container, once during Swing internal #set_preferred_siee
    JPanel.should_receive(:new).twice.and_return mock_container

    mock_dimension = mock(:dimension)
    java.awt.Dimension.should_receive(:new).with(131,137).and_return mock_dimension

    shoelace.width = 131
    shoelace.height = 137
    mock_container.should_receive(:set_preferred_size).
      with(mock_dimension)
    shoelace.gui_flow_init
  end

  it "should have a margin" do
    mock_container = mock(:jpanel, :set_layout => true)

    mock_border = mock(:border)
    javax.swing.border.EmptyBorder.should_receive(:new).
      with(7,7,7,7).and_return mock_border
    shoelace.margin = 7

    shoelace.gui_flow_init
  end

  after :all do
    SWT::Widgets::Display.getDefault.dispose
  end

end