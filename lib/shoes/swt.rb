require 'white_shoes'

require 'rubygems'
require 'swt'

def window(*a, &b)
  Shoes.app(*a, &b)
end

require 'shoes/swt/element_methods'
require 'shoes/swt/app'
require 'shoes/swt/layout'
#require 'shoes/swt/window'
require 'shoes/swt/flow'
require 'shoes/swt/button'

module Shoes
  module Swt


  include Log4jruby::LoggerForClass

  def self.app(opts={}, &blk)
    Shoes::App.new(opts, &blk)
    logger.debug "Exiting Shoes.app"
  end


  end

end


