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
      @opts = opts.stringify_keys

      @blk = blk

      # Initialize current point
      @left = @x = @opts['x'] || 0
      @top = @y = @opts['y'] || 0
      @width = @height = 0

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
