shared_examples_for "movable object with disposable gui element" do
  it "disposes its gui element" do
    gui_element.should_receive(:dispose)
    subject.move(300, 200)
    raise
  end
end
