require 'facets/kernel/constant'
require 'facets/string'

module Shoes
  class Configuration
    class << self
      attr_accessor :framework

      def framework=(value)
        # Only SWT works this way right now
        if value.to_s == 'swt'
          @framework = value.to_s.downcase
          require "shoes/#{@framework}"
        else
          @framework = value
          require value
        end
      end
      def framework_class
        # Only SWT works this way right now
        if @framework == 'swt'
          constant("shoes/#{@framework}".modulize)
        else
          constant(@framework.camelcase)
        end
      end
    end

  end
end

def Shoes.configuration
  Shoes::Configuration
end
