require 'swt_shoes/spec_helper'

describe SwtShoes::Shape do

  class ShapeShoeLaces
    include SwtShoes::Shape
    attr_accessor :gui_container
    attr_reader :gui_element
    attr_reader :blk
    attr_reader :width, :height
    def initialize(opts = {}, blk = nil )
      @opts = opts.stringify_keys
      gui_init
    end
  end

  let(:gui_container) { double('gui_container', add_paint_listener: "Paint Listener") }
  let(:shoelaces) {
    ShapeShoeLaces.new gui_container: gui_container
  }

  subject { shoelaces }

  it "uses Swt and not White Shoes" do
    subject.class.ancestors.should include(SwtShoes::Shape)
    Object.const_defined?('WhiteShoes').should be_false
    subject
  end

  it "has gui container" do
    subject.gui_container.should_not be_nil
  end

  describe "gui_init" do

    its(:gui_element) { should be_instance_of(Swt::Path) }
  end
end
