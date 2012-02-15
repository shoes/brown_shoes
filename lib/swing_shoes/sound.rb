require 'shoes/layout'

module SwingShoes
  module Flow
    import java.awt.BorderLayout
    import java.awt.Dimension
    import java.awt.FlowLayout
    import javax.swing.JPanel
    import javax.swing.BoxLayout

    import javax.swing.border.EmptyBorder

    def gui_flow_init
      #def initialize(parent_container, opts={}, &blk)
      #  opts.stringify_keys!
      #  @parent_container = parent_container
      self.gui_container = container = JPanel.new()
      #layout = BoxLayout.new(@container, BoxLayout::LINE_AXIS)
      layout = FlowLayout.new
      layout.alignment = FlowLayout::LEFT

      container.set_layout(layout)

      #debugger
      unless self.parent_gui_container.is_a? BorderLayout
        if (self.height && self.width)
          container.set_preferred_size(Dimension.new(self.width, self.height))
        end
      end

      if self.margin
        container.border = EmptyBorder.new(margin, margin, margin, margin)
        #@container.border = javax.swing.border.LineBorder.new(java.awt.Color::RED, 2, true)
        #@container.setBackground(java.awt.Color::PINK)
      end

    end

    def gui_flow_add_to_parent
      self.parent_gui_container.add(self.gui_container, BorderLayout::CENTER)
    end
  end
end


module Shoes
  class Flow
    include SwingShoes::Flow
  end
end

