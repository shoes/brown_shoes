module MockHelpers
  def apply_mock_app
    # mocking for SWT part of $main_display (Shoes::App)
    mock_display = mock(:display, :isDisposed => true, :dispose => true)
    SWT::Widgets::Display.stub(:getDefault) { mock_display }
  end

  def apply_mock_window
    # mocking for SWT part of Shoes::Window
    mock_shell = mock(:shell, :setSize => true, :setText => true, :addListener => true, :pack => true, :open => true)
    SWT::Widgets::Shell.stub(:new) { mock_shell }
  end

  def apply_mock_flow
    # mocking for SWT part of Shoes::Flow
    mock_composite = mock(:composite, :setLayout => true, :pack => true)
    SWT::Layouts::Composite.stub(:new) { mock_composite }
    mock_layout = mock(:layout, :type= => true)
    SWT::Layouts::FillLayout.stub(:new) { mock_layout }
  end
  
end