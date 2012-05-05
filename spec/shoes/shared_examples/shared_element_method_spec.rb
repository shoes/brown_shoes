shared_examples_for "object with stroke" do
  let(:color) { Shoes::COLORS[:tomato] }

  specify "returns a color" do
    c = subject.stroke = color
    c.class.should eq(Shoes::Color)
  end

  specify "sets on receiver" do
    subject.stroke = color
    subject.stroke.should eq(color)
    subject.style[:stroke].should eq(color)
  end
end


