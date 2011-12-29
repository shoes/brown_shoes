module MockHelpers
  def apply_mock_app
    # mocking for SWT part of $main_display (Shoes::App)
    mock_display = mock(:display, :isDisposed => true, :dispose => true)
    SwtDisplay.stub(:getDefault) { mock_display }
  end

  def apply_mock_window
    # mocking for SWT part of Shoes::Window
    mock_shell = mock(:shell, :setSize => true, :setText => true, :addListener => true, :pack => true, :open => true)
    SwtShell.stub(:new) { mock_shell }
  end

  def apply_mock_flow
    # mocking for SWT part of Shoes::Flow
    mock_composite = mock(:composite, :setLayout => true, :pack => true)
    SwtComposite.stub(:new) { mock_composite }
    mock_layout = mock(:layout, :type= => true)
    SwtFillLayout.stub(:new) { mock_layout }
  end
  
end