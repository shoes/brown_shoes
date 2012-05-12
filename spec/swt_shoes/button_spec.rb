require "spec_helper"

require 'swt_shoes/spec_helper'

#require 'support/shared_examples_for_common_elements_spec'

describe SwtShoes::Button do

  #it_should_behave_like "A Common Element"

  class ButtonShoeLaces
    attr_accessor :gui_container, :gui_element, :text, :height, :width, :margin, :click_event_lambda
    attr_accessor :app

    # because SwtShoes::Button#move calls super :(
    def move(left, top)
      # no-op
    end
  end

  let(:gui_container) { double("gui container", :get_layout => true) }
  let(:gui_element) { double("gui element") }
  let(:app_gui_container) { double("app gui container") }
  let(:app) { double("app", :gui_container => app_gui_container) }
  let(:shoelace) {
    shoelace = ButtonShoeLaces.new
    shoelace.extend described_class
    shoelace.gui_container = gui_container
    shoelace.gui_element = gui_element
    shoelace.app = app
    shoelace
  }

  subject { shoelace }

  it_behaves_like "movable object with disposable gui element"

  describe "WhiteShoes requirements" do
    let(:mock_element) { mock(:element, :setText => true,
    :pack => true )}
    before do

      Swt::Widgets::Button.stub(:new).
        and_return mock_element
    end
    it_behaves_like "A WhiteShoes Shoes::Button"
  end

#describe "Elementary Button Example" do
#  before(:all) do
#    @gui = Shoes.app do
#      stack do
#        edit_line :id => "edit"
#
#        button :text => "Change to Hello", :id => 'button_one' do
#          @elements['edit'].to_java.setText("Hello")
#        end
#
#        button :text => 'Change to Goodbye', :id => 'button_two' do
#          @elements['edit'].to_java.setText("Goodbye")
#        end
#
#      end
#    end
#  end
#
#  it "Should contain elements with id of edit, button_one, and button_two" do
#    @gui.elements.should include('edit')
#    @gui.elements.should include('button_one')
#    @gui.elements.should include('button_two')
#  end
#
#  it "Should make the edit_box's contents say 'Hello' when button_one is clicked" do
#    @gui.elements['button_one'].to_java.doClick()
#    @gui.elements['edit'].to_java.getText.should == 'Hello'
#  end
#
#  it "Should make the edit_box's contents say 'Goodbye' when button_two is clicked" do
#    @gui.elements['button_two'].to_java.doClick()
#    @gui.elements['edit'].to_java.getText.should == 'Goodbye'
#  end
#
#  after(:all) do
#    @gui.frame.dispose()
#  end
#end

end
