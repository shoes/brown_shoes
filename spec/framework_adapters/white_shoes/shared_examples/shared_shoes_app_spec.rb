
shared_examples "A WhiteShoes Shoes::App" do
  describe "initializer" do
    it "should accept zero arity" do
      expect {
        described_class.new
      }.not_to raise_exception
    end

    it "should accept opts and block" do
      expect {
        described_class.new('options' => true) { ; }
      }.not_to raise_exception
    end

  end
end