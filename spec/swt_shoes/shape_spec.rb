require 'swt_shoes/spec_helper'

describe SwtShoes::Shape do

  class ShapeShoeLaces
    include SwtShoes::Shape
    attr_accessor :gui_container
    attr_reader :gui_element
    attr_reader :blk
    attr_reader :width, :height
  end

  let(:gui_container) { Swt::Widgets::Shell.new }
  let(:shoelaces) {
    ShapeShoeLaces.new.tap do |s|
      s.gui_container = gui_container
    end
  }

  subject { shoelaces }

  it "uses Swt and not White Shoes" do
    subject.class.ancestors.should include(SwtShoes::Shape)
    Object.const_defined?('WhiteShoes').should be_false
    subject
  end

  it "has proper gui container" do
    subject.gui_container.should be_instance_of(Swt::Widgets::Shell)
  end

  describe "gui_init" do
    before(:each) { subject.gui_init }
    its(:gui_element) { should be_instance_of(Swt::Path) }
  end
end
