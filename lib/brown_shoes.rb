require 'java'

require 'rubygems'

require 'brown_shoes/app'
require 'brown_shoes/elements/native'
require 'brown_shoes/elements/layout'
require 'brown_shoes/elements/button'
require 'brown_shoes/elements/stack'
require 'brown_shoes/elements/flow'
require 'brown_shoes/elements/edit_line'
require 'brown_shoes/elements/edit_box'
require 'brown_shoes/elements/check'
require 'brown_shoes/elements/image'

module Shoes

def self.app(opts={}, &blk)
  Shoes::App.new(opts, &blk)
end

end
