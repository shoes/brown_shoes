require "spec_helper"
require "spec/swing_shoes/spec_helper"

    import javax.swing.JFrame

describe SwingShoes::App do

  context "White Shoes Shared Examples" do

    let(:mock_pane) { mock(:content_pane, :setSize => true ) }

    before :each do
      JFrame.any_instance.stub(:get_content_pane).
        and_return mock_pane
      JFrame.any_instance.stub(:set_visible)
    end

    after :each do
      #subject.gui_container.close
    end

    it_behaves_like "A WhiteShoes Shoes::App"

  end

end
