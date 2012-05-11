module SwtShoes
  module Button

    def gui_button_init
    # Create a button on the specified _shell_
    #def initialize(container, text = 'Button', opts = {}, &blk)
      self.gui_element = button = Swt::Widgets::Button.new(self.gui_container, Swt::SWT::PUSH)
      button.setText(self.text)
      #@native_widget.setBounds(10, 10, 150, 30)

      button.addSelectionListener(self.click_event_lambda) if click_event_lambda
      button.pack
    end

    def move(left, top)
      super(left, top)
      unless gui_element.is_disposed
        puts "gui_element: #{gui_element.inspect}"
        puts "parent:      #{gui_container.inspect}"

        # This element is part of a layout, we need to pop it into its own
        # composite layer before moving it, so the rest of of the elements in
        # the layout can reflow.
        if gui_container.get_layout

          # FIXME: we need a new gui_element for this button, that belongs to a
          # different composite, with a different layout, so that it can be
          # positioned. This is to pop it out of a RowLayout. But--once it's out,
          # it should belong to the "whole canvas", and at that point, we don't
          # need to recreate the gui element to move it.
          old_gui_container = gui_container
          puts "old gui_container: #{gui_container.inspect}"
          puts "app gui_container: #{@app.gui_container.inspect}"
          self.gui_container = Swt::Widgets::Composite.new(@app.gui_container, Swt::SWT::NONE)
          puts "new gui_container: #{gui_container.inspect}"
          puts "gui containers have same parent: #{self.gui_container.parent == old_gui_container.parent}"
          # first attempt disposed and recreated gui_element...
          gui_element.dispose
          puts "disposed gui_element"
          self.gui_container.set_layout nil
          gui_element = Swt::Widgets::Button.new(gui_container, Swt::SWT::PUSH).tap do |button|
            button.set_text(self.text)
            button.add_selection_listener(self.click_event_lambda) if click_event_lambda
            button.pack
          end
          gui_container.set_bounds(0, 0, @app.gui_container.size.x, @app.gui_container.size.y)

          puts "new gui_container's children:\n  #{gui_container.children.map(&:inspect).join("\n  ")}"
          puts "new gui_container's bounds:      #{gui_container.bounds}"
          puts "old gui_container's children:\n  #{old_gui_container.children.map(&:inspect).join("\n  ")}"
          puts "app gui_container's children:\n  #{@app.gui_container.children.map(&:inspect).join("\n  ")}"

          old_gui_container.layout
        end
        gui_element.set_location left, top
        gui_element.redraw
      end
    end
  end
end

module Shoes
  class Button
    include SwtShoes::Button
  end
end
