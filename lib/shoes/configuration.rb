module Shoes
  class Configuration
    class << self
      attr_accessor :framework

      def framework=(value)
        @framework = value
        require "shoes/framework_adapters/#{value}"
      end
    end

  end
end

def Shoes.configuration
  Shoes::Configuration
end
