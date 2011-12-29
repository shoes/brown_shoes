require 'shoes/composite'

module Shoes
  class Flow < Composite

    def initialize composite_parent, &blk
      @composite = SwtComposite.new(composite_parent, Swt::NONE)
      fill_layout = SwtFillLayout.new
      fill_layout.type = Swt::VERTICAL
      @composite.setLayout(fill_layout)

      instance_eval &blk if block_given?

      @composite.pack
    end

  end
end
