require 'shoes/animation'

describe Shoes::Animation do
  let(:gui_container) { double("gui container") }
  subject { Shoes::Animation.new(gui_container, 30) }

  it "defaults to started" do
    subject.should_not be_stopped
  end

  context "started" do
    it "is not stopped" do
      subject.should_not be_stopped
    end

    it "stops" do
      subject.stop
      subject.should be_stopped
    end

    it "toggles to stopped" do
      subject.toggle
      subject.should be_stopped
    end
  end

  context "stopped" do
    before :each do
      subject.stop
    end

    it "is stopped" do
      subject.should be_stopped
    end

    it "starts" do
      subject.start
      subject.should_not be_stopped
    end

    it "toggles to off" do
      subject.toggle
      subject.should_not be_stopped
    end
  end

  it "counts frames" do
    counter = 0
    animation = Shoes::Animation.new(gui_container, 24) { |frame| counter += frame }
    sleep(0.1)
    counter.should be > 0
  end
end
