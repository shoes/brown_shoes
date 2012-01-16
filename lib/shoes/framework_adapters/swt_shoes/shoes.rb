require 'java'

require 'rubygems'
require 'facets/hash'

require 'swt'

require 'lib/log4j/log4j-1.2.16.jar'
require 'log4jruby'
require 'log4jruby/logger_for_class'
logger = Log4jruby::Logger.get('test', :tracing => true, :level => :debug )
logger.debug("Shoooes!")

require 'shoes/framework_adapters/swt_shoes/app'
#require 'shoes/framework_adapters/swt_shoes/element_methods'
require 'shoes/framework_adapters/swt_shoes/layout'
#require 'shoes/framework_adapters/swt_shoes/native'
require 'shoes/framework_adapters/swt_shoes/window'
#require 'shoes/framework_adapters/swt_shoes/flow'
#require 'shoes/framework_adapters/swt_shoes/button'
#require 'shoes/framework_adapters/swt_shoes/animation'

module Shoes

  include Log4jruby::LoggerForClass

  def self.app(opts={}, &blk)
    Shoes::App.new(opts, &blk)
    logger.debug "Exiting Shoes.app"
  end

end

def window(*a, &b)
  Shoes.app(*a, &b)
end
