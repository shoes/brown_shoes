require 'shoes/layout'

module Shoes
  class Window < Layout

    attr_reader :container

    import org.eclipse.swt.graphics.Color

    def initialize(opts = {}, &blk)
      opts.stringify_keys!
      @elements = opts['elements']

      @container = Swt::Widgets::Shell.new(Swt.display, Swt::SWT::CLOSE)

      width, height = opts['width'] || DEFAULT_WIDTH, opts['height'] || DEFAULT_HEIGHT

      @container.setSize(width, height)
      @container.setText(opts['title'] || DEFAULT_TITLE)
      @container.setBackground(Color.new(Swt.display, 50, 0, 0))

      if opts['on_close']
        logger.debug "Shell #{@container.inspect} adding block #{blk.inspect}"
        @container.addListener(Swt::SWT::Close, opts['on_close'])
      end

      instance_eval &blk if block_given?
      @container.pack

      @container.open
    end

  end
end
