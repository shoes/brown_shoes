require 'shoes/framework_adapters/framework_adapter_support'

module Shoes
class BaseObject
    # All RuGUI objects clan have access to framework adapters.
    include Shoes::FrameworkAdapters::FrameworkAdapterSupport

end
end
