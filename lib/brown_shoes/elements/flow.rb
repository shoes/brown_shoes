module Shoes
class Flow < Layout
  import javax.swing.JPanel
  import javax.swing.BoxLayout
  import java.awt.Dimension
  import javax.swing.border.EmptyBorder

  attr_accessor :parent_container, :container

  def initialize(parent_container, opts={}, &blk)
    @parent_container = parent_container
    @container = JPanel.new()
    layout = BoxLayout.new(@container, BoxLayout::LINE_AXIS)
    @container.set_layout(layout)
    
    if(opts[:height] && opts[:width])
      @container.set_preferred_size(java.awt.Dimension.new(opts[:width], opts[:height]))
    end

    if margin = opts[:margin]
      @container.border = EmptyBorder.new(margin, margin, margin, margin)
    end

    instance_eval &blk if block_given?
    parent_container.add(container)

    super
  end
end
end