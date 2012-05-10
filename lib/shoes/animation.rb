require 'shoes/timer_base'
#require 'runnable_block'

module Shoes
  class Animation < TimerBase
    def initialize gui_container, fps, &blk
      @current_frame = 0
      super gui_container, fps, &blk
    end
  end
end
