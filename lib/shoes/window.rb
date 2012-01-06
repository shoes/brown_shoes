require 'shoes/layout'

module Shoes
  class Window < Layout

    DEFAULT_WIDTH = 800
    DEFAULT_HEIGHT = 600
    DEFAULT_TITLE = "Shooes!"

    attr_reader :container

    def initialize(opts = {}, &blk)
      opts.stringify_keys!
      @elements = opts['elements']

      @container = SWT::Widgets::Shell.new($display, SWT::CLOSE)

      width, height = opts['width'] || DEFAULT_WIDTH, opts['height'] || DEFAULT_HEIGHT

      @container.setSize(width, height)
      @container.setText(opts['title'] || DEFAULT_TITLE)

      if opts['on_close']
        logger.debug "Shell #{@composite.inspect} adding block #{blk.inspect}"
        @container.addListener(SWT::CLOSE, opts['on_close'])
      end

      instance_eval &blk if block_given?
      #@container.pack

      @container.open
    end

  end
end
