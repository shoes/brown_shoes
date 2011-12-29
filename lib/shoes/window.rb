require 'shoes/composite'

module Shoes
  class Window < Composite

    DEFAULT_WIDTH = 800
    DEFAULT_HEIGHT = 600
    DEFAULT_TITLE = "Shooes!"


    def initialize(opts = {}, &blk)
      opts.stringify_keys!
      @elements = opts['elements']

      @composite = SwtShell.new($display, Swt::CLOSE)

      width, height = opts['width'] || DEFAULT_WIDTH, opts['height'] || DEFAULT_HEIGHT

      @composite.setSize(width, height)
      @composite.setText(opts['title'] || DEFAULT_TITLE)

      if opts['on_close']
        logger.debug "Shell #{@composite.inspect} adding block #{blk.inspect}"
        @composite.addListener(Swt::Close, opts['on_close'])
      end

      instance_eval &blk
      @composite.pack

      @composite.open
    end

  end
end
