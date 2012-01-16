require 'shoes/layout'

module Shoes
class Flow < Layout
  import java.awt.BorderLayout
  import java.awt.Dimension
  import java.awt.FlowLayout
  import javax.swing.JPanel
  import javax.swing.BoxLayout

  import javax.swing.border.EmptyBorder

  attr_accessor :parent_container, :container

  def initialize(parent_container, opts={}, &blk)
    opts.stringify_keys!
    @parent_container = parent_container
    @container = JPanel.new()
    #layout = BoxLayout.new(@container, BoxLayout::LINE_AXIS)
    layout = FlowLayout.new
    layout.alignment = FlowLayout::LEFT

    @container.set_layout(layout)
    #debugger
    unless parent_container.is_a? BorderLayout
    if(opts['height'] && opts['width'])
      #@container.set_preferred_size(Dimension.new(opts['width'], opts['height']))
    end
    end
    
    if margin = opts['margin']
      #@container.border = EmptyBorder.new(margin, margin, margin, margin)
      #@container.border = javax.swing.border.LineBorder.new(java.awt.Color::RED, 2, true)
      @container.setBackground(java.awt.Color::PINK)
    end

    instance_eval &blk if block_given?
    parent_container.add(container, BorderLayout::CENTER)

    super
  end
end
end