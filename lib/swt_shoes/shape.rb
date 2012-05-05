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

    # The initialization hook for SwtShoes.
    #
    # Swt calls to Shoes::Shape#new should include in the style hash
    # a :gui key that contains Swt-specific settings.
    #
    # Example:
    #
    #   args[:top] = 100
    #   args[:width] = 80
    #   args[:gui] = {
    #     container: self.gui_container,
    #     paint_callback: lambda do |event, shape|
    #       gc = event.gc
    #       gc.set_antialias Swt::SWT::ON
    #       gc.set_line_width 1
    #       gc.draw_oval(shape.left, shape.top, shape.width, shape.height)
    #     end
    #   }
    #
    #   This hook method is only interested in the `:gui` values.
    #
    #   Note in particular the `:paint_callback`. It has 2 parameters. The
    #   first is the Swt event that will trigger the callback. The second is
    #   this shape.
    def gui_init
      @gui_container = @gui_opts[:container]
      if @gui_opts[:element]
        @gui_element = @gui_opts[:element]
        @gui_element.move_to(@x, @y)
      end
      @gui_paint_callback = lambda do |e|
        @gui_opts[:paint_callback].call(e, self)
      end
      @gui_container.add_paint_listener(@gui_paint_callback)
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
