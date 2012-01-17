require 'shoes'
require 'swt'

#require 'shoes/framework_adapters/swt_shoes/window'

module SwtShoes

  # Shoes::App.new creates a new Shoes application window!
  # The default window is a [flow]
  #
  class App < WhiteShoes::App
    include SwtShoes::ElementMethods

    include Log4jruby::LoggerForClass

    attr_accessor :elements, :frame
    attr_accessor :main_shell, :container

    DEFAULT_WIDTH = 800
    DEFAULT_HEIGHT = 600
    DEFAULT_TITLE = "Shooes!"

    def initialize(adapted_object)
      @elements = {}

      opts = adapted_object.opts
      blk = adapted_object.blk

      @container = Swt::Widgets::Shell.new($display, Swt::SWT::CLOSE)

      width, height = opts['width'] || DEFAULT_WIDTH, opts['height'] || DEFAULT_HEIGHT

      @container.setSize(width, height)
      @container.setText(opts['title'] || DEFAULT_TITLE)

      @container.addListener(Swt::SWT::Close, main_window_on_close)

      flow do
        instance_eval &blk if blk
      end

      @container.open

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
