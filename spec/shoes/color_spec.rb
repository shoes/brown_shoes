require 'shoes/color'

describe Shoes::Color do

  shared_examples_for "black" do
    its(:class) { should eq(Shoes::Color) }
    its(:red) { should eq(0) }
    its(:green) { should eq(0) }
    its(:blue) { should eq(0) }
    it { should be_black }
    it { should_not be_white }
  end

  context "black" do
    context "with optional alpha" do
      subject { Shoes::Color.new(0, 0, 0, 0) }
      it_behaves_like "black"
      its(:alpha) { should be 0 }
    end

    context "without optional alpha" do
      subject { Shoes::Color.new(0, 0, 0) }
      it_behaves_like "black"
      its(:alpha) { should be(255) }
    end

    context "using floats" do
      context "with optional alpha" do
        subject { Shoes::Color.new(0.0, 0.0, 0.0, 0.0) }
        it_behaves_like "black"
        its(:alpha) { should be 0 }
      end

      context "without optional alpha" do
        subject { Shoes::Color.new(0.0, 0.0, 0.0) }
        it_behaves_like "black"
        its(:alpha) { should be(255) }
      end
    end
  end

  context "white" do
    subject { Shoes::Color.new(255, 255, 255) }
    it { should be_white }
    it { should_not be_black }
  end

  context "peru" do
    shared_examples_for "peru" do
      its(:class) { should eq(Shoes::Color) }
      it { should_not be_black }
      it { should_not be_white }
    end

    shared_examples_for "peru (integers)" do
      its(:class) { should eq(Shoes::Color) }
      its(:red) { should eq(205) }
      its(:green) { should eq(133) }
      its(:blue) { should eq(63) }
    end

    context "with optional alpha" do
      subject { Shoes::Color.new(205, 133, 63, 100) }
      it_behaves_like("peru")
      it_behaves_like("peru (integers)")
      its(:alpha) { should eq(100) }
    end

    context "without optional alpha" do
      subject { Shoes::Color.new(205, 133, 63) }
      it_behaves_like("peru")
      it_behaves_like("peru (integers)")
      its(:alpha) { should eq(255) }
    end

    context "using floats" do
      let(:delta) { 1.0000001 } # rounding

      shared_examples_for "peru (floats)" do
        its(:red) { should be_within(delta).of(205) }
        its(:green) { should be_within(delta).of(133) }
        its(:blue) { should be_within(delta).of(63) }
      end

      context "with optional alpha" do
        subject { Shoes::Color.new(0.80, 0.52, 0.25, 0.39) }
        it_behaves_like "peru"
        it_behaves_like("peru (floats)")
        its(:alpha) { should be_within(delta).of(100) }
      end

      context "without optional alpha" do
        subject { Shoes::Color.new(0.80, 0.52, 0.25) }
        it_behaves_like "peru"
        it_behaves_like("peru (floats)")
        its(:alpha) { should eq(255) }
      end
    end
  end

  describe "bad input" do

  end

  describe "light and dark" do
    let(:lightgreen) { Shoes::Color.new(144, 238, 144) }
    let(:darkgreen) { Shoes::Color.new(0, 100, 0) }
    let(:mediumseagreen) { Shoes::Color.new(60, 179, 113) }

    specify "light color is light" do
      lightgreen.should be_light
      mediumseagreen.should_not be_light
      darkgreen.should_not be_light
    end

    specify "dark color is dark" do
      lightgreen.should_not be_dark
      mediumseagreen.should_not be_dark
      darkgreen.should be_dark
    end
  end

  describe "transparency" do
    let(:transparent) { Shoes::Color.new(25, 25, 112, 0) }
    let(:semi) { Shoes::Color.new(25, 25, 112, 100) }
    let(:opaque) { Shoes::Color.new(25, 25, 25) }

    specify "only transparent colors are transparent" do
      transparent.should be_transparent
      semi.should_not be_transparent
      opaque.should_not be_transparent
    end

    specify "only opaque colors should be opaque" do
      transparent.should_not be_opaque
      semi.should_not be_opaque
      opaque.should be_opaque
    end
  end

  describe "comparable" do
    let(:color_1) { Shoes::Color.new(255, 69, 0) } # orangered

    it "is equal when values are equal" do
      color_2 = Shoes::Color.new(255, 69, 0)
      color_1.should eq(color_2)
    end

    it "is less than when darker" do
      color_2 = Shoes::Color.new(255, 70, 0)
      color_1.should be < color_2
    end

    it "is greater than when lighter" do
      color_2 = Shoes::Color.new(255, 68, 0)
      color_1.should be > color_2
    end
  end

  describe "rgb" do
    let(:color) { Shoes::Color.new(135, 206, 235) } # skyblue
    let(:new_color) { color.rgb(135, 206, 235) }

    it "returns a new Shoes::Color object" do
      new_color.should_not equal(color)
      new_color.should eq(color)
    end

    it "accepts alpha" do
      color.rgb(135, 206, 235, 40).alpha.should eq(40)
    end

    it "allows alpha to be omitted" do
      new_color.alpha.should eq(255)
    end
  end
end

describe "Shoes built-in colors" do
  specify "there are 140" do
    Shoes::COLORS.length.should eq(140)
  end

  class MockApp
    include Shoes::ElementMethods
  end

  subject { MockApp.new }

  its(:papayawhip) { should eq(Shoes::Color.new(255, 239, 213)) }
  its(:aquamarine) { should eq(Shoes::Color.new(127, 255, 212)) }
end

