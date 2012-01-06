require 'shoes/layout'

module Shoes
  class Window < Layout

    DEFAULT_WIDTH = 800
    DEFAULT_HEIGHT = 600
    DEFAULT_TITLE = "Shooes!"

    attr_reader :swt_composite

    def initialize(opts = {}, &blk)
      opts.stringify_keys!
      @elements = opts['elements']

      @swt_composite = SWT::Widgets::Shell.new($display, SWT::CLOSE)

      width, height = opts['width'] || DEFAULT_WIDTH, opts['height'] || DEFAULT_HEIGHT

      @swt_composite.setSize(width, height)
      @swt_composite.setText(opts['title'] || DEFAULT_TITLE)

      if opts['on_close']
        logger.debug "Shell #{@composite.inspect} adding block #{blk.inspect}"
        @swt_composite.addListener(SWT::CLOSE, opts['on_close'])
      end

      instance_eval &blk
      #@swt_composite.pack

      @swt_composite.open
    end

  end
end
