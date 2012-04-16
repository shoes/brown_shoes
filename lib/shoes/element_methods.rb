# FIXME: shoes/animation and shoes/sound require java. They shouldn't.
#require 'shoes/animation'
#require 'shoes/sound'
require 'shoes/button'
require 'shoes/color'
require 'shoes/flow'
require 'shoes/shape'

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
    def line(x1, y1, x2, y2, opts={})
      args = {}
      args[:left], end_x = x1 < x2 ? [x1, x2] : [x2, x1]
      args[:top], end_y = y1 < y2 ? [y1, y2] : [y2, y1]
      args[:gui] = opts[:gui]
      path = lambda { line_to(end_x, end_y) }
      Shoes::Shape.new(args, path)
    end

    # Draws an oval at (left, top) with either
    #
    # Signatures:
    #   - oval(left, top, radius)
    #   - oval(left, top, width, height)
    #   - oval(styles)
    #       where styles is a hash with any or all of these keys:
    #         left, top, width, height, radius, center
    def oval(*opts)
      defaults = {left: 0, top: 0, width: 0, height: 0, radius: 0, center: false}
      args = opts.last.class == Hash ? opts.pop : {}
      case opts.length
        when 0, 1
        when 2; args[:left], args[:top]  = opts
        when 3; args[:left], args[:top], args[:radius] = opts
        else args[:left], args[:top], args[:width], args[:height] = opts
      end
      args = defaults.merge(args)
      args[:width] = args[:radius] * 2 if args[:width].zero?
      args[:height] = args[:width] if args[:height].zero?
      if args[:center]
        args[:left] -= args[:width] / 2
        args[:top] -= args[:height] / 2
      end
      Shoes::Shape.new args
    end

    # Creates a new Shoes::Color object
    def rgb(red, green, blue, alpha = Shoes::Color::OPAQUE)
      Shoes::Color.new(red, green, blue, alpha)
    end
  end
end
