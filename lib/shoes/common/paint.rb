module Shoes
  module Common
    module Paint
      DEFAULTS = {:stroke => Shoes::COLORS[:black]}
      def stroke
        @style[:stroke]
      end

      def stroke=(color)
        @style[:stroke] = color
      end
    end
  end
end
