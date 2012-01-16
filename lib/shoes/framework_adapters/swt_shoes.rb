require 'shoes/framework_adapters/white_shoes'

require 'rubygems'
require 'swt'

def window(*a, &b)
  Shoes.app(*a, &b)
end

require 'shoes/framework_adapters/swt_shoes/app'
require 'shoes/framework_adapters/swt_shoes/element_methods'
require 'shoes/framework_adapters/swt_shoes/layout'
require 'shoes/framework_adapters/swt_shoes/window'
require 'shoes/framework_adapters/swt_shoes/flow'

module SwtShoes
  module Shoes


  include Log4jruby::LoggerForClass

  def self.app(opts={}, &blk)
    Shoes::App.new(opts, &blk)
    logger.debug "Exiting Shoes.app"
  end


  end

end


