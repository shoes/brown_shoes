module Shoes
  class Layout
    include SwtConstants
    include Log4jruby::LoggerForClass

    #def stack(opts={}, &blk)
    #  tstack = Stack.new(opts)
    #  layout(tstack, &blk)
    #end

    def flow(opts = {}, &blk)
      swt_flow = Shoes::Flow.new @composite, opts, &blk
    end


    def button(text, opts={}, &blk)
      button = Shoes::Button.new(@composite, text, opts, &blk)
      #@elements[button.to_s] = button
      #button
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
    #
    #def layout(layer, &blk)
    #  parent = @current_panel
    #  @current_panel = layer.panel
    #  instance_eval &blk
    #  parent.add(@current_panel)
    #  @current_panel = parent
    #end


  end
end