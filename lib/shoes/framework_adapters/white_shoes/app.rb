module WhiteShoes
  module Shoes
       # Adapter Template for the BaseApp methods specific for the framework.
    class App < Base

      def initialize(opts={}, &blk)
        super
      end

      # Runs the application, starting anything the framework needs.
      def run
      end

      # Refreshes the GUI application, running just one event loop.
      #
      # This method is mostly useful when writing tests. It shouldn't be used
      # in normal applications.
      def refresh
      end

      # Exits the application, freeing any resources used by the framework.
      def quit
      end
    end
  end
end

