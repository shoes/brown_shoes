require 'shoes/native'

module Shoes
  class Button < Native

    # Create a button on the specified _shell_
    def initialize(container, text, opts = {}, &blk)
      @container = container
      @native_widget = SWT::Widgets::Button.new(@container, SWT::PUSH)
      @native_widget.setText(text)
      #@native_widget.setBounds(10, 10, 150, 30)
      @native_widget.addSelectionListener(&blk) if block_given?
      @native_widget.pack
    end

  end
end
