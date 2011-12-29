require 'shoes/element'

module Shoes
  class Button < Element

    def initialize(shell, text, opts = {}, &blk)
      @swt_button = SwtButton.new(shell, Swt::PUSH)
      @swt_button.setText(text)
      @swt_button.setBounds(10, 10, 150, 30)
      @swt_button.addSelectionListener(&blk) if block_given?
    end

    # To change this template use File | Settings | File Templates.
  end
end
