require 'shoes/composites'

module Shoes
  class Composite
    include SwtConstants
    include Log4jruby::LoggerForClass
    include Elements
    include Composites

    attr_reader :composite

  end
end
