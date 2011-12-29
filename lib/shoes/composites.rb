module Shoes
  module Composites
    #def stack(opts={}, &blk)
    #  tstack = Stack.new(opts)
    #  layout(tstack, &blk)
    #end

    def flow &blk
      swt_flow = Shoes::Flow.new @composite, &blk
    end

  end
end