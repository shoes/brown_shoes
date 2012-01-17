require 'shoes/layout'

# flow takes these options
#   :margin - integer - add this many pixels to all 4 sides of the layout
module Shoes
  class Flow < Layout

    # container - holds the widgets and controls painting
    # layout - directs the container on _where_ to place widgets
    attr_reader :container, :layout

    def initialize composite_parent, opts = {}, &blk
      super
    end

  end
end
