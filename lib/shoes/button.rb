require 'shoes/native'

module Shoes
  class Button < Native

    attr_reader :swt_widget

    # Create a button on the specified _shell_
    def initialize(shell, text, opts = {}, &blk)
      @swt_widget = SWT::Widgets::Button.new(shell, SWT::PUSH)
      @swt_widget.setText(text)
      @swt_widget.setBounds(10, 10, 150, 30)
      @swt_widget.addSelectionListener(&blk) if block_given?
    end

  end
end
