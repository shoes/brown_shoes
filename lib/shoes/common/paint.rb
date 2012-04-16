module Shoes
  module Common
    module Paint
      def stroke
        @style[:stroke]
      end

      def stroke=(color)
        @style[:stroke] = color
      end
    end
  end
end
