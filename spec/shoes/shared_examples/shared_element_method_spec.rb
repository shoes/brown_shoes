shared_examples_for "object with stroke" do
  specify "returns a color" do
    subject.stroke(Shoes::COLORS[:tomato]).class.should eq(Shoes::Color)
  end

  specify "sets on receiver" do
    subject.stroke Shoes::COLORS[:tomato]
    subject.style[:stroke].should eq(Shoes::COLORS[:tomato])
  end
end


