require 'facets/kernel/constant'
require 'facets/string'

module Shoes
  class BaseObject

    def framework
      
      begin
        framework_klass = Shoes.configuration.framework.camelcase + "::#{self.class.to_s}"
        constant(framework_klass)
      rescue NameError
        unless @tried
          require "shoes/framework_adapters/#{Shoes.configuration.framework}"
          @tried = true
          retry
        end
      end

    end
  end
end
