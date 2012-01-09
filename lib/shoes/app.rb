require 'shoes'
require 'swt'

module Shoes

  # Shoes::App.new creates a new Shoes application window!
  # The default window is a [flow]
  # 
  class App
    include Log4jruby::LoggerForClass

    attr_accessor :elements, :frame
    attr_accessor :main_shell


    def initialize(opts={}, &blk)
      @elements = {}

      window_opts = opts.merge(:on_close => main_window_on_close, :elements => @elements)
      @main_window = Window.new(window_opts) do
        flow do
          instance_eval &blk if block_given?
        end
      end

      Swt.event_loop { Swt.display.isDisposed }

      logger.debug "Swt.display disposed... exiting Shoes::App.new"
    end

    private
    def main_window_on_close
      lambda {
        logger.debug "main_window on_close block begin... disposing Swt.display"
        Swt.display.dispose
        logger.debug "Swt.display disposed"
      }
    end
  end
end