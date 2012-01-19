#debugger
#require 'native'
module Shoes
  class Button

    attr_accessor :parent_gui_container, :blk
    attr_accessor :gui_element
    attr_accessor :text, :width, :height

    def initialize(parent_gui_container, text = 'Button', opts={}, &blk)

      gui_button_init
    end

  end
end