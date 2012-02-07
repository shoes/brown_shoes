
shared_examples "A WhiteShoes Shoes::App" do
  class ShoeLacesApp
    attr_accessor :opts, :blk, :gui_container
    attr_accessor :width, :height, :title

    def initialize(opts, &blk)
      self.opts = opts
      self.blk = blk
      self.width = 1
      self.height = 1
    end
  end
  let(:shoelaces) {
    shoelaces = ShoeLacesApp.new({}) {}
    shoelaces.stub_chain(:logger, :debug)
    shoelaces.extend described_class
    shoelaces
  }

  subject { shoelaces }

  describe "gui_init" do
    it "should leave a reference to the framework object for further operations" do
      subject.should_receive(:gui_container=).with(anything)
      subject.gui_init
    end
  end
  describe "gui_open" do
    it "should do gui work" do

    end
  end
end
