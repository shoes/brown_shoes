module Shoes
  class Button < Native

    attr_accessor :native_widget

    def initialize(parent, text = 'Button', opts={}, &blk)
      super(opts)
      @native_widget = javax.swing.JButton.new(text)
      @native_widget.add_action_listener(&blk) unless blk.nil?
      parent.add(@native_widget)
      return self
    end

  end
end