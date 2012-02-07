
shared_examples_for "A WhiteShoes Shoes::Flow" do
  class ShoeLacesFlow
    attr_accessor :blk, :gui_container
    attr_accessor :width, :height, :margin
    attr_accessor :parent_gui_container
  end

  let(:shoelaces) {
    shoelaces = ShoeLacesFlow.new({}) {}
    shoelaces.stub_chain(:logger, :debug)
    shoelaces.extend described_class
    shoelaces
  }

  subject { shoelaces }

  describe "gui_flow_init" do
    it "should leave a reference to the container" do
      subject.should_receive(:gui_container=).with(anything)
      subject.gui_flow_init
    end
  end
end
