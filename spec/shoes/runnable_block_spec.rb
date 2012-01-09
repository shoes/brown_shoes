require "spec_helper"

require 'timeout'

describe Shoes::RunnableBlock do

  it "should set the timer on the display" do
    rblk = Shoes::RunnableBlock.new(10, lambda {})
    mock_display = mock(:display, :timer_exec => true)
    Swt.stub(:display) { mock_display }
    rblk.set_next_timer
  end

  it "should allow a 'stop' to break the loop" do
    blk = lambda { stop }
    rblk = Shoes::RunnableBlock.new(10, blk)

    expect {
      Timeout::timeout(1) {
        rblk.init
      }
    }.not_to raise_error
  end

  it "should yield 'frame' to the block" 

  it "should yield with zero arity"

  it "should count the frames"

  it "should limit the frame rate to fps" 


end