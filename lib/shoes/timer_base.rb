module Shoes
  class TimerBase
    def initialize gui_container, fps, &blk
      @gui_container, @fps, @blk = gui_container, fps, blk
      @stopped = false
      gui_init
    end

    def start
      @stopped = false
    end

    def stop
      @stopped = true
    end

    def stopped?
      @stopped
    end

    def toggle
     @stopped = !@stopped
    end
  end
end
