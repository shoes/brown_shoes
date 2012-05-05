require 'facets/hash'
require 'shoes/common_methods'
require 'shoes/common/paint'
require 'shoes/common/style'

module Shoes
  class Shape
    include Shoes::CommonMethods
    include Shoes::Common::Paint
    include Shoes::Common::Style

    attr_reader :blk
    attr_reader :x, :y

    # Creates a new Shoes::Shape
    #
    # Implementation frameworks should pass in any required arguments
    # through the +opts+ hash.
    #
    # opts['x'] - the initial x-position for drawing
    # opts['y'] - the initial y-position for drawing
    def initialize(opts={}, blk = nil)
      @gui_opts = opts.delete(:gui) || {}
      @style = opts

      @blk = blk

      @left = @style[:left] || 0
      @top = @style[:top] || 0
      @width = @style[:width] || 0
      @height = @style[:height] || 0

      # Initialize current point to (left, top)
      @x, @y = @left, @top

      gui_init

      instance_eval &@blk unless @blk.nil?
    end

    # Update bounds and sizes
    # TODO: Handle all of the edge cases
    def update_bounds
      if @x < @left
        @width += @left - @x
        @left = @x
      elsif @x > right
        @width += (@x - right)
      end

      if @y < @top
        @height += @top - @y
        @top = @x
      elsif @y > bottom
        @height += @y - bottom
      end
    end
  end
end
