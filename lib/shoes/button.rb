#debugger
#require 'native'
module Shoes
  class Button < BaseObject

    def initialize(container, text = 'Button', opts={}, &blk)

      @framework_adapter = self.framework.new container, text, opts, &blk

      #super(opts)
      #@native_widget = javax.swing.JButton.new(text)
      #@native_widget.add_action_listener(&blk) unless blk.nil?
      #container.add(@native_widget)
      #return self
    end

  end
end