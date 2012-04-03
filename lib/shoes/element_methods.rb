#require 'animation'

#require 'native'
#require 'button'
#require 'flow'

module Shoes
  module ElementMethods

    #def stack(opts={}, &blk)
    #  tstack = Stack.new(opts)
    #  layout(tstack, &blk)
    #end

    def flow(opts = {}, &blk)
      swt_flow = Shoes::Flow.new(self, self.gui_container, opts, blk)
    end


    def button(text, opts={}, &blk)
      button = Shoes::Button.new(self.gui_container, text, opts, blk)
      #@elements[button.to_s] = button
      #button
    end

    def animate(fps = 10, &blk)
      anim = Shoes::Animation.new(self, fps, &blk)
    end

    # similar controls as Shoes::Video (#video)
    def sound(soundfile, opts = {}, &blk)
      playable_sound = Shoes::Sound.new(gui_container, soundfile, opts, &blk)
    end

    #
    #def image(path, opts={})
    #  image = Image.new(path, @current_panel, opts)
    #  @elements[image.identifier] = image
    #  image
    #end
    #
    #def edit_line(opts={})
    #  eline = Edit_line.new(@current_panel, opts)
    #  @elements[eline.identifier] = eline
    #  eline
    #end
    #
    #def text_box(opts={})
    #  tbox = Text_box.new(@current_panel, opts)
    #  @elements[tbox.identifier] = tbox
    #  tbox
    #end
    #
    #def check(opts={}, &blk)
    #  cbox = Check.new(@current_panel, opts)
    #  @elements[cbox.identifier] = cbox
    #  cbox
    #end
    #

    # Draws a line from (x1,y1) to (x2,y2)
    # TODO: Probably don't need to use the full-on Swt::Path for this
    def line(x1, y1, x2, y2)
      path = lambda { line_to(x2, y2) }
      Shoes::Shape.new(self.gui_container, {x: x1, y: y1}, path)
    end
  end
end
