require 'white_shoes/common_methods'

module WhiteShoes
  # Shape methods
  #
  # Including classes must provide:
  #
  # @x          - the current x-value
  # @y          - the current y-value
  #
  module Shape
    attr_accessor :gui_container
    attr_accessor :gui_element

    def gui_init
      self.gui_element = "A new gui Shape"
    end

    def move_to(x, y)
      @x, @y = x, y
      update_bounds
    end

    def line_to(x, y)
      move_to(x, y)
    end
  end
end

module Shoes
  class Shape
    include WhiteShoes::Shape
  end
end

