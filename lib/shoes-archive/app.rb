#require 'shoes/window'

module Shoes

  # Shoes::App.new creates a new Shoes application window!
  # The default window is a [flow]
  # 
  class App < BaseObject

    include Log4jruby::LoggerForClass

    attr_accessor :elements, :framework_adapter
    attr_accessor :main_shell

    # Returns the framework_adapter for this class.
    def framework_adapter_klass
      framework_adapter_for('App')
    end

            attr_reader :frame, :container

        import javax.swing.JPanel
        import javax.swing.JFrame
        import java.awt.Dimension
        import java.awt.FlowLayout
        import java.awt.BorderLayout
        import javax.swing.BoxLayout

        DEFAULT_HEIGHT = 600
        DEFAULT_WIDTH = 800

        def initialize(opts={}, &blk)
          opts.stringify_keys!
          height = opts['height'] ||= DEFAULT_HEIGHT
          width = opts['width'] ||= DEFAULT_WIDTH

          @elements = {}
          @frame = JFrame.new()

          @container = @frame.get_content_pane

          @layout = FlowLayout.new(FlowLayout::LEFT)
          #@layout.alignment = FlowLayout::LEFT
          @frame.setLayout(@layout)

          #flow(opts, &blk)
          instance_eval &blk

          @frame.setDefaultCloseOperation(JFrame::EXIT_ON_CLOSE)
          #@container.border = javax.swing.border.LineBorder.new(java.awt.Color::BLUE, 4, true)
          @container.setBackground(java.awt.Color::BLUE)

          #@frame.pack()
          if opts['pack']
            @frame.pack
          else
            @frame.setSize(Dimension.new(opts['width'], opts['height']))
            @container.setSize(Dimension.new(opts['width'], opts['height']))
          end
          @frame.set_visible(true)

          #debugger; 1

        end


    #def initialize(opts={}, &blk)
    #  #debugger
    #
    #  @framework_adapter = self.framework_adapter_klass.new opts, &blk
    #
    #  debugger; 1
    #
    #  #def swt_implementation
    #    #@elements = {}
    #    #
    #    #window_opts = opts.merge(:on_close => main_window_on_close, :elements => @elements)
    #    #@main_window = Window.new(window_opts) do
    #    #  flow do
    #    #    instance_eval &blk if block_given?
    #    #  end
    #    #end
    #    #
    #    #Swt.event_loop { Swt.display.isDisposed }
    #    #
    #    #logger.debug "Swt.display disposed... exiting Shoes::App.new"
    #  #end
    #end

    #private
    #def main_window_on_close
    #  lambda {
    #    logger.debug "main_window on_close block begin... disposing Swt.display"
    #    Swt.display.dispose
    #    logger.debug "Swt.display disposed"
    #  }
    #end
  end
end