require 'shoes/layout'

# flow takes these options
#   :margin - integer - add this many pixels to all 4 sides of the layout
module Shoes
  class Flow < Layout

    # @swt_layout is not "the layout"... in SWT the composite is the "container"
    # that holds the bounds, contains the widgets, etc.
    attr_reader :swt_composite, :swt_layout

    def initialize composite_parent, opts = {}, &blk
      @swt_composite = SWT::Layouts::Composite.new(composite_parent, SWT::NONE)

      # RowLayout is horizontal by default, wrapping by default
      @swt_layout = SWT::Layouts::RowLayout.new

      # set the margins
      margin(opts[:margin]) if opts[:margin]

      @swt_composite.setLayout(@swt_layout)

      instance_eval &blk if block_given?

      @swt_composite.pack
    end

    # Add this many pixels to margins on layout
    def margin(margin_pixels)
      @swt_layout.marginTop = margin_pixels
      @swt_layout.marginRight = margin_pixels
      @swt_layout.marginBottom = margin_pixels
      @swt_layout.marginLeft = margin_pixels
    end
  end
end
