require "spec_helper"
require 'shoes/runnable_block'

describe Shoes::Animation do
  before do
    @main_display = mock(:display, :shells => [], :dispose => true,
                         :timer_exec => true)
  end

  it "should create a Runnable" do
    mock_runnable = mock(:runnable, :init => true)
    Shoes::RunnableBlock.should_receive(:new).and_return mock_runnable
    Shoes::Animation.new(1) {}
  end

end
