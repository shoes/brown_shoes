module SwingShoes

  module App

    attr_reader :frame, :container

    import javax.swing.JPanel
    import javax.swing.JFrame
    import java.awt.Dimension
    import java.awt.FlowLayout
    import java.awt.BorderLayout
    import javax.swing.BoxLayout

    def gui_init

      frame = JFrame.new()

      self.gui_container = container = frame.get_content_pane

      layout = FlowLayout.new(FlowLayout::LEFT)

      frame.setLayout(layout)

      instance_eval &blk if blk

      frame.setDefaultCloseOperation(JFrame::EXIT_ON_CLOSE)

      if opts['pack']
        frame.pack
      else
        frame.setSize(Dimension.new(self.width, self.height))
        container.setSize(Dimension.new(self.width, self.height))
      end
      frame.set_visible(true)

    end
  end
end

module Shoes
  class App
    include SwingShoes::App
  end
end
