require 'java'

require 'rubygems'
require 'facets/hash'

#$:<< 'lib/shoes'

require 'lib/log4j/log4j-1.2.16.jar'
require 'log4jruby'
require 'log4jruby/logger_for_class'
logger = Log4jruby::Logger.get('test', :tracing => true, :level => :debug )
logger.debug("Shoooes!")

require 'shoes/configuration'
Shoes.configuration.framework ||= 'swing_shoes'

require 'shoes/base_object'



require 'shoes/app'
#require 'shoes/native'
#require 'shoes/element_methods'
#require 'shoes/animation'
#require 'shoes/runnable_block'
#require 'shoes/timer_base'
#require 'shoes/layout'
#require 'shoes/button'
#require 'shoes/stack'
#require 'shoes/flow'
#require 'shoes/edit_line'
#require 'shoes/edit_box'
#require 'shoes/check'
#require 'shoes/image'

