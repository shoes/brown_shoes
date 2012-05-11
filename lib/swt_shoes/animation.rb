require 'shoes/timer_base'
require 'shoes/runnable_block'

module SwtShoes
  module Animation
    def gui_init
      # Wrap the animation block so we can count frames.
      # Note that the task re-calls itself on each run.
      task = Proc.new do
        @blk.call(@current_frame)
        @current_frame += 1
        @gui_container.redraw
        Swt.display.timer_exec 1000 / @framerate, task
      end
      Swt.display.timer_exec 1000 / @framerate, task
    end

    def run
    end
    #def initialize fps, &blk
      #ms_per_frame = 1000 / fps

      #if block_given?
        #@runnable = RunnableBlock.new(ms_per_frame, blk)

        #@runnable.init
      #end
    #end

    #def stop
      #@runnable.stop
    #end

    #def start
      #@runnable.start
    #end

  end
end

module Shoes
  class Animation
    include SwtShoes::Animation
  end
end
