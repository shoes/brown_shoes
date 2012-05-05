require 'spec_helper'
require 'white_shoes/shape'
require 'support/shared_examples_for_common_elements_spec'


describe WhiteShoes::Shape do
  class ShoeLacesShape
    attr_reader :gui_container
    attr_reader :gui_element
    attr_reader :blk
    attr_reader :width, :height
  end

  let(:shoelaces) {
    ShoeLacesShape.new.tap do |s|
      s.extend described_class
    end
  }

  subject { shoelaces }

  #it_behaves_like "A Common Element"

end
