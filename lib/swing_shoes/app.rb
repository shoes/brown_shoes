module SwingShoes

  module App

    attr_accessor :frame

    import javax.swing.JPanel
    import javax.swing.JFrame
    import java.awt.Dimension
    import java.awt.FlowLayout
    import java.awt.BorderLayout
    import javax.swing.BoxLayout

    def gui_init

      self.frame = JFrame.new()

      self.gui_container = frame.get_content_pane

      layout = FlowLayout.new(FlowLayout::LEFT)

      self.frame.setLayout(layout)

      self.frame.setDefaultCloseOperation(JFrame::EXIT_ON_CLOSE)


    end

    def gui_open
      if opts['pack']
        self.frame.pack
      else
        self.frame.setSize(Dimension.new(self.width, self.height))
        self.gui_container.setSize(Dimension.new(self.width, self.height))
      end
      self.frame.set_visible(true)

    end
  end
end

module Shoes
  class App
    include SwingShoes::App
  end
end
