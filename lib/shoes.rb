require 'java'

require 'swt.jar'

require 'rubygems'
require 'facets/hash'

require 'lib/log4j/log4j-1.2.16.jar'
require 'log4jruby'
require 'log4jruby/logger_for_class'
logger = Log4jruby::Logger.get('test', :tracing => true, :level => :debug )
logger.debug("Shooes!")

require 'shoes/swt_constants'
require 'shoes/app'
require 'shoes/element_methods'
require 'shoes/layout'
require 'shoes/native'
require 'shoes/window'
require 'shoes/flow'
require 'shoes/button'
require 'shoes/animation'

#require 'shoes/elements/element'
#require 'shoes/elements/button'
#require 'shoes/elements/stack'
#require 'shoes/elements/flow'
#require 'shoes/elements/edit_line'
#require 'shoes/elements/edit_box'
#require 'shoes/elements/check'
#require 'shoes/elements/image'

module Shoes
  include SwtConstants
  include Log4jruby::LoggerForClass

  def self.app(opts={}, &blk)
    Shoes::App.new(opts, &blk)
    logger.debug "Exiting Shoes.app"
  end

end
