module Shoes

  # Shoes::App.new creates a new Shoes application window!
  # The default window is a [flow]
  # 
  class App
    include SwtConstants
    include Log4jruby::LoggerForClass

    attr_accessor :elements, :frame
    attr_accessor :main_shell


    def initialize(opts={}, &blk)
      @elements = {}

      $main_display = SWT::Widgets::Display.getDefault

      window_opts = opts.merge(:on_close => main_window_on_close, :elements => @elements)
      @main_window = Window.new(window_opts) do
        flow do
          instance_eval &blk if block_given?
        end
      end

      while (!$main_display.isDisposed) do
        $main_display.sleep unless $main_display.readAndDispatch
      end

      $main_display.dispose unless $main_display.isDisposed

      #logger.debug "$main_display disposed... exiting Shoes::App.new"
    end

    private
    def main_window_on_close
      lambda {
        #logger.debug "main_window on_close block begin... disposing $main_display"
        $main_display.dispose
        #logger.debug "$main_display disposed"
      }
    end
  end
end