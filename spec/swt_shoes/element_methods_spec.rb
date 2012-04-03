require 'swt_shoes/spec_helper'

# FIXME: These specs are copied from spec/shoes/element_methods_spec.rb
#        We should run the same specs instead of duplicating.
describe "Basic Element Methods" do
  class ElementMethodsShoeLaces
    attr_accessor :gui_container
    include Shoes::ElementMethods
  end

  Shoes.configuration.framework = 'swt_shoes'

  describe "line" do
    let(:gui_container) { Swt::Widgets::Shell.new }
    # The line object
    subject {
      s = ElementMethodsShoeLaces.new
      s.gui_container = gui_container
      s.line(10, 15, 100, 60)
    }

    context "same as WhiteShoes" do
      it { should be_instance_of(Shoes::Shape) }
      its(:top) { should eq(15) }
      its(:left) { should eq(10) }
      its(:width) { should eq(90) }
      its(:height) { should eq(45) }
    end

    context "Swt-specific" do

    end
  end
end
