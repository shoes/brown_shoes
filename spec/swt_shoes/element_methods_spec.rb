require 'swt_shoes/spec_helper'

# FIXME: These specs are copied from spec/shoes/element_methods_spec.rb
#        We should run the same specs instead of duplicating.
describe "Basic Element Methods" do
  class ElementMethodsShoeLaces
    attr_accessor :gui_container
    include Shoes::ElementMethods
    include SwtShoes::ElementMethods
    def initialize
      @style = {}
    end
  end

  Shoes.configuration.framework = 'swt_shoes'

  let(:gui_container) { double('gui_container') }

  shared_examples_for "paintable" do
    it "registers for painting" do
      gui_container.should_receive(:add_paint_listener) do |callback|
        callback.should be_lambda
      end
      subject
    end
  end

  describe "line" do
    # The line object
    subject {
      s = ElementMethodsShoeLaces.new
      s.gui_container = gui_container
      s.line(10, 15, 100, 60)
    }

    context "same as WhiteShoes" do
      before :each do
        gui_container.stub(:add_paint_listener)
      end
      it { should be_instance_of(Shoes::Shape) }
      its(:top) { should eq(15) }
      its(:left) { should eq(10) }
      its(:width) { should eq(90) }
      its(:height) { should eq(45) }
    end

    context "Swt-specific" do
    end

    it_behaves_like "paintable"
  end

  describe "oval" do
    # The oval object
    subject {
      s = ElementMethodsShoeLaces.new
      s.gui_container = gui_container
      s.oval(30, 20, 100, 200)
    }
    context "Swt-specific" do
    end

    it_behaves_like "paintable"
  end
end
