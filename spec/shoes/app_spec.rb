require "rspec"
require 'shoes'
require 'shoes/app'
require 'shoes/swt_constants'

include SwtConstants

describe Shoes::App do

  it "eval a block" do

    # mocking for SWT part of $main_display (Shoes::App)
    mock_display = mock(:display, :isDisposed => true, :dispose => true)
    SwtDisplay.stub(:getDefault) { mock_display }
    # mocking for SWT part of Shoes::Window
    mock_shell = mock(:shell, :setSize => true, :setText => true, :addListener => true, :pack => true, :open => true)
    SwtShell.stub(:new) { mock_shell }

    # mocking for SWT part of Shoes::Flow
    mock_composite = mock(:composite, :setLayout => true, :pack => true)
    SwtComposite.stub(:new) { mock_composite }
    mock_layout = mock(:layout, :type= => true)
    SwtFillLayout.stub(:new) { mock_layout }

    
    outer = 0
    Shoes::App.new do
      outer = 1
    end
    outer.should == 1
  end
end