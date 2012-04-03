require 'swt'

module Swt
  include_package 'org.eclipse.swt.graphics'
  include_package 'org.eclipse.swt.events'
end

def window(*a, &b)
  Shoes.app(*a, &b)
end

#require 'swt_shoes/element_methods'
require 'swt_shoes/app'
require 'swt_shoes/layout'
#require 'swt_shoes/window'
require 'swt_shoes/flow'
require 'swt_shoes/button'
require 'swt_shoes/shape'

module SwtShoes
  module Shoes


  include Log4jruby::LoggerForClass

  def self.app(opts={}, &blk)
    Shoes::App.new(opts, &blk)
    logger.debug "Exiting Shoes.app"
  end


  end

end


