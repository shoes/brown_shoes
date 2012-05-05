require 'facets/hash'
require 'shoes/common_methods'

module Shoes
  class Shape
    include Shoes::CommonMethods

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
      @opts = opts

      @blk = blk

      @left = @opts[:left] || 0
      @top = @opts[:top] || 0
      @width = @opts[:width] || 0
      @height = @opts[:height] || 0

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
