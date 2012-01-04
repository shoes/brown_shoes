require "spec_helper"

describe Shoes::Animation do

  it "should create a thread" do
    Thread.should_receive(:new)
    Shoes::Animation.new {}
  end

  it "should have a loop" do
    Thread.stub(:new).and_yield(self)
    Shoes::Animation.any_instance.should_receive(:loop_at_framerate)
    Shoes::Animation.new {}
  end

  it "should allow a 'stop' to break the loop" do
    anim = Shoes::Animation.new 10

    outer = 0
    anim.loop_at_framerate anim, 10 do
      outer += 1
      stop
    end
    outer.should == 1
  end

  it "should yield 'frame' to the block" do
    anim = Shoes::Animation.new 10

    anim.should respond_to :frame
    anim.should respond_to :stop
  end

  it "should count the frames" do
    anim = Shoes::Animation.new 10

    start = Time.now.to_f
    outer = nil
    anim.loop_at_framerate anim, 10 do
      stop if (start + 0.2) < Time.now.to_f
      outer = frame
    end
    outer.should >= 1
  end

  it "should limit the frame rate to fps" do
    anim = Shoes::Animation.new 10

    start = Time.now.to_f
    outer = nil
    anim.loop_at_framerate anim, 30 do
      stop if (start + 0.3) <= Time.now.to_f
      outer = frame
    end
    outer.should be_within(1).of(9)

  end


end
