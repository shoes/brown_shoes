require 'shoes/timer_base'

module Shoes
  class Animation < TimerBase

    attr_reader :thread
    attr_reader :frame

    def initialize fps, &blk
      @frame = 1

      if block_given?
        @thread = Thread.new(self) do |this|
          loop_at_framerate this, fps, &blk
        end
      end
    end

    def loop_at_framerate this, fps, &blk
      start = Time.now.to_f
      frame_delta = 1.0 / fps
      last_frame_time = start
      until @stop
        if (last_frame_time + frame_delta) <= Time.now.to_f
          this.instance_eval &blk
          @frame += 1
          last_frame_time = Time.now.to_f
        end
      end
      @thread.join if @thread
    end

    def stop
      @stop = true
    end

  end
end
