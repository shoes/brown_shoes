require "spec_helper"
require 'shoes/runnable_block'

require 'ostruct'


describe Shoes::Animation do
  before do
    @main_display = mock(:display, :shells => [], :dispose => true,
                         :timer_exec => true)
  end

  it "should set the timer on the display" do
    Swt.should_receive(:timer_exec).with(1000)

    Shoes::Animation.new(self, 1) {}
  end

  it "should yield 'frame' to the block" do
    outer_frame = nil

    Shoes::Animation.new(self, 10) do |frame|
      outer_frame = frame

    end

    outer_frame.should == 1

  end

  it "should allow a 'stop' to break the loop" do
    expect {
      Timeout::timeout(1) do
        anim = Shoes::Animation.new(self,10) do
          stop
        end
      end
    }.to_not raise_error
  end

  it "should count the frames" do
    this = OpenStruct.new( :outer_frame => nil )

    anim = Shoes::Animation.new(this,10) do |frame|
      debugger
      outer_frame = frame
      stop if frame > 9
    end
    this.outer_frame.should == 10

  end


  it "should limit the frame rate to fps" do

    anim = Shoes::Animation.new 10

  end

end
