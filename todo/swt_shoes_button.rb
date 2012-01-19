require 'shoes/native'

module SwingShoes
  class Button < Native

    # Create a button on the specified _shell_
    def initialize(container, text = 'Button', opts = {}, &blk)
      @container = container
      @native_widget = Swt::Widgets::Button.new(@container, Swt::SWT::PUSH)
      @native_widget.setText(text)
      #@native_widget.setBounds(10, 10, 150, 30)
      @native_widget.addSelectionListener(&blk) if block_given?
      @native_widget.pack
    end

  end
end
