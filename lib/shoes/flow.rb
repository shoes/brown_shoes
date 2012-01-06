require 'shoes/layout'

# flow takes these options
#   :margin - integer - add this many pixels to all 4 sides of the layout
module Shoes
  class Flow < Layout

    # container - holds the widgets and controls painting
    # layout - directs the container on _where_ to place widgets
    attr_reader :container, :layout

    def initialize composite_parent, opts = {}, &blk
      @container = SWT::Layouts::Composite.new(composite_parent, SWT::NONE)

      # RowLayout is horizontal by default, wrapping by default
      @layout = SWT::Layouts::RowLayout.new

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
