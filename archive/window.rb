#require 'shoes/framework_adapters/swt_shoes/layout'

module SwtShoes
  class Window < Layout

    DEFAULT_WIDTH = 800
    DEFAULT_HEIGHT = 600
    DEFAULT_TITLE = "Shooes!"

    attr_reader :container

    def initialize(opts = {}, &blk)
      opts.stringify_keys!
      @elements = opts['elements']

      @container = Swt::Widgets::Shell.new($display, Swt::SWT::CLOSE)

      width, height = opts['width'] || DEFAULT_WIDTH, opts['height'] || DEFAULT_HEIGHT

      @container.setSize(width, height)
      @container.setText(opts['title'] || DEFAULT_TITLE)

      if opts['on_close']
        logger.debug "Shell #{@container.inspect} adding block #{blk.inspect}"
        @container.addListener(Swt::SWT::Close, opts['on_close'])
      end

      instance_eval &blk if block_given?
      #@container.pack

      @container.open
    end

  end
end