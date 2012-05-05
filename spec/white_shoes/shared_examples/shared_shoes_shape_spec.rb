shared_examples_for "A WhiteShoes Shoes::Shape" do
  describe "gui_init" do
    it "should leave a reference to the container" do
      subject.should_receive(:gui_element=).with(anything)
      subject
    end
  end
end
