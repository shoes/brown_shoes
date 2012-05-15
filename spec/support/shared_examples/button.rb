
shared_examples_for "A WhiteShoes Shoes::Button" do
  class ShoeLacesButton
    attr_accessor :gui_container, :blk
    attr_accessor :gui_element, :click_event_lambda
    attr_accessor :text, :width, :height
  end

  let(:shoelaces) {
    shoelaces = ShoeLacesButton.new({}) {}
    #shoelaces.stub_chain(:logger, :debug)
    shoelaces.extend described_class
    shoelaces
  }

  subject { shoelaces }

  describe "gui_button_init" do
    it "should leave a reference to the container" do
      subject.should_receive(:gui_element=).with(anything)
      subject.gui_button_init
    end
  end
end
