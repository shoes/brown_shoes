module SwingShoes
  module Button

    include SwingShoes::CommonMethods

    attr_accessor :native_widget

    import javax.swing.JButton

    def gui_button_init
    #def initialize(parent, text = 'Button', opts={}, &blk)
      self.gui_element = button = JButton.new(self.text)
      button.add_action_listener(self.click_event_lambda) if self.click_event_lambda
      self.gui_container.add(button)
    end

  end
end


module Shoes
  class Button
    include SwingShoes::Button
  end
end


