module Shoes
  class Color
    include Comparable

    def initialize(red, green, blue, alpha=255)
      to_rgb = lambda { |v| v.is_a?(Fixnum) ? v : (255 * v).round }
      @red = to_rgb.call(red)
      @green = to_rgb.call(green)
      @blue = to_rgb.call(blue)
      @alpha = to_rgb.call(alpha)
    end

    attr_reader :red, :green, :blue, :alpha

    # In Red Shoes, returns a new color object with these rgb values,
    # like a shortcut for Shoes::Color.new
    def rgb(red, green, blue, alpha = 255)
      Shoes::Color.new(red, green, blue, alpha)
    end

    def light?
      @red + @green + @blue > 510 # 0xaa * 3
    end

    def dark?
      @red + @green + @blue < 255 # 0x55 * 3
    end

    def transparent?
      @alpha == 0
    end

    def opaque?
      @alpha == 255
    end

    def white?
      @red == 255 && @green == 255 && @blue == 255
    end

    def black?
      @red == 0 && @green == 0 && @blue == 0
    end

    def <=>(other)
      return 0 if @red == other.red && @green == other.green && @blue == other.blue && @alpha == other.alpha
      return 1 if @red + @green + @blue > other.red + other.green + other.blue
      return -1 if @red + @green + @blue < other.red + other.green + other.blue
    end
  end
end
