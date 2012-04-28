require 'facets/hash'
require 'shoes/common_methods'
require 'shoes/common/paint'
require 'shoes/common/style'
require 'shoes/line'

module Shoes
  class Shape
    include Shoes::CommonMethods
    include Shoes::Common::Paint
    include Shoes::Common::Style

    attr_reader :blk
    attr_reader :x, :y

    # Creates a new Shoes::Shape
    #
    # This is a composite shape, which has one or more components.
    #
    # Implementation frameworks should pass in any required arguments
    # through the +opts+ hash.
    def initialize(opts = {}, blk = nil)
      @style = Shoes::Common::Paint::DEFAULTS.merge(opts)

      @blk = blk

      # Component shapes
      @components = []

      # GUI
      @gui_opts = @style.delete(:gui)
      gui_init

      instance_eval &@blk unless @blk.nil?
    end

    def left
      @left || @components.map(&:left).min || 0
    end

    def top
      @top || @components.map(&:top).min || 0
    end

    def right
      @right || @components.map { |c| c.left + c.width }.max || left
    end

    def bottom
      @bottom || @components.map { |c| c.top + c.height }.max || top
    end

    def width
      (left - right).abs
    end

    def height
      (top - bottom).abs
    end

    # Moves the shape
    #
    # Moves each component so bounds calculations still work.
    def move(left, top)
      relative_left, relative_top = offset(left, top)
      @components.each do |c|
        c_left = c.left
        c_top = c.top
        c.move(c_left + relative_left, c_top + relative_top)
      end
      @left, @top, @right, @bottom = left, top, nil, nil
    end

    # Gives the relative offset from the current position
    #
    # Returns [left, top] values that should be added to the current
    # position in order to move to the new coordinate.
    def offset(left, top)
      relative_left = (left - self.left).abs
      relative_top = (top - self.top).abs
      relative_left = -relative_left if left < self.left
      relative_top = -relative_top if top < self.top
      [relative_left, relative_top]
    end

  end
end
