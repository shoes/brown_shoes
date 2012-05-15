require "spec_helper"
require "white_shoes"

describe WhiteShoes::App do

    it_behaves_like "A WhiteShoes Shoes::App"

  context "ShoesFramework::App requirements" do
    subject {
      shoelaces = Object.new
      shoelaces.extend WhiteShoes::App

    }
  end

end
