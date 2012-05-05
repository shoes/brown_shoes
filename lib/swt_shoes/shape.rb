module SwtShoes
  # Shape methods
  #
  # Including classes must provide:
  #
  # @x          - the current x-value
  # @y          - the current y-value
  # @opts       - options
  #
  module Shape
    attr_reader :gui_container
    attr_reader :gui_element

    def gui_init
      @gui_container = @opts['gui_container']
      @gui_element = Swt::Path.new(Swt::Widgets::Display.get_current)
      @gui_element.move_to(@x, @y)
      @gui_container.add_paint_listener(lambda do |e|
        #return if hidden?
        gc = e.gc
        gc.set_antialias Swt::SWT::ON
        gc.set_line_width 1
        gc.draw_path(gui_element)
      end)
    end

    def line_to(x, y)
      @x, @y = x, y
      @gui_element.line_to(x, y)
      update_bounds
    end

    def move_to(x, y)
      @x, @y = x, y
      @gui_element.move_to(x, y)
      update_bounds
    end
  end
end

module Shoes
  class Shape
    include SwtShoes::Shape
  end
end
