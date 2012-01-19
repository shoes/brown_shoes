require 'swt'

#require 'shoes/framework_adapters/swt_shoes/window'

module SwtShoes

  # Shoes::App.new creates a new Shoes application window!
  # The default window is a [flow]
  #
  module App

    def gui_init
      self.gui_container = container = Swt::Widgets::Shell.new($display, Swt::SWT::CLOSE)

      opts = self.opts

      container.setSize(self.width, self.height)
      container.setText(self.title)

      container.addListener(Swt::SWT::Close, main_window_on_close)
    end


    def gui_open
      container.open

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

module Shoes
  class App
    include SwtShoes::App
  end
end

