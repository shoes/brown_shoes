module Shoes
  module Common
    # Style methods.
    #
    # Requirements
    #
    # @style
    module Style
      PAINT_DEFAULTS = {:stroke => Shoes::COLORS[:black]}
      def style(new_styles = {})
        @style.merge! new_styles
      end
    end
  end
end
