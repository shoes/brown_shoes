module SwtShoes
  module Color
    def to_native
      Swt::Graphics::Color.new(Swt.display, @red, @green, @blue)
    end
  end
end

module Shoes
  class Color
    include SwtShoes::Color
  end
end
