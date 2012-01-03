#require 'set'

shared_examples_for "A Common Element" do

  describe "basic dimensions" do
    let(:display) { SWT::Widgets::Display.getDefault }
    let(:shell) { SWT::Widgets::Shell.new(display) }
    let(:flow)  { Shoes::Flow.new(shell) }
    let(:swt_composite) { flow.swt_composite }

    subject {   described_class.new(swt_composite, "text") }

    it { should respond_to :top }
    its(:top) { should_not be_nil }

    it { should respond_to :right }
    its(:right) { should_not be_nil }

    it { should respond_to :bottom }
    its(:bottom) { should_not be_nil }

    it { should respond_to :left }
    its(:left) { should_not be_nil }

    it { should respond_to :height }
    its(:height) { should_not be_nil }

    it { should respond_to :width }
    its(:width) { should_not be_nil }

    it { should respond_to :hide }

    it { should respond_to :show }

    it { should respond_to :toggle }
  end
end