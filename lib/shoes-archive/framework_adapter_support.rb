 require 'shoes/framework_adapters/base_framework_adapter'
require 'facets/string'
require 'facets/kernel/constant'
 
module Shoes
  module FrameworkAdapters
    module FrameworkAdapterSupport
      def framework_adapter_for(class_name)
        @framework_adapter ||= {}
        load_framework_adapter(class_name) unless @framework_adapter[class_name]
        @framework_adapter[class_name]
      end

      def load_framework_adapter(class_name)
        #@framework_adapter[class_name] = class_adapter_for(class_name).new(self)
        @framework_adapter[class_name] = class_adapter_for(class_name)
      end

      module CommonClassAndInstanceMethods
        def adapter_module_name(framework_adapter = Shoes.configuration.framework)
          "Shoes::FrameworkAdapters::#{framework_adapter.camelcase}"
        end

        def class_adapter_for(class_name)
          constant("#{adapter_module_name}::#{class_name}")
        rescue
          # Fallback to the base_framework_adapter.
          constant("#{adapter_module_name('base_framework_adapter')}::#{class_name}")
        end
      end

      def self.included(base)
        base.send(:include, CommonClassAndInstanceMethods)
        base.extend(CommonClassAndInstanceMethods)
      end
    end
  end
end
