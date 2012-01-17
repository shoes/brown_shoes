#require 'shoes/framework_adapters/swt_shoes/layout'

module SwtShoes
# flow takes these options
#   :margin - integer - add this many pixels to all 4 sides of the layout

  class Flow < Layout

    # container - holds the widgets and controls painting
    # layout - directs the container on _where_ to place widgets
    attr_reader :container, :layout

    def initialize composite_parent, opts = {}, &blk
      @container = Swt::Widgets::Composite.new(composite_parent, Swt::SWT::NONE)

      # RowLayout is horizontal by default, wrapping by default
      @layout = Swt::Layout::RowLayout.new

      # set the margins
      margin(opts[:margin]) if opts[:margin]

      if opts['width'] && opts['height']
        @container.setSize(opts['width'], opts['height'])
      end

      @container.setLayout(@layout)

      instance_eval &blk if block_given?

      @container.pack
    end

    # Add this many pixels to margins on layout
    def margin(margin_pixels)
      @layout.marginTop = margin_pixels
      @layout.marginRight = margin_pixels
      @layout.marginBottom = margin_pixels
      @layout.marginLeft = margin_pixels
    end
  end
end
