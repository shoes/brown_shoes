module Shoes
  module Common
    module Style
      def style(new_styles = {})
        @style.merge! new_styles
      end
    end
  end
end
