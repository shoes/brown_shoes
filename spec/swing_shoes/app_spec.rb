require "spec_helper"
require "spec/swing_shoes/spec_helper"

describe SwingShoes::App do

  it_behaves_like "A WhiteShoes Shoes::App"


  after :each do
    subject
  end

end
