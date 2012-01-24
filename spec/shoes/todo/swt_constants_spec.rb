require "spec_helper"

describe 'SwtConstants' do

  it "should wrap Eclipse SWT Library" do

    SWT::NONE.should == org.eclipse.swt.SWT::NONE
    SWT::CLOSE.should == org.eclipse.swt.SWT::CLOSE

    SWT::Layouts::FillLayout.should == org.eclipse.swt.layout::FillLayout
    SWT::Layouts::RowLayout.should == org.eclipse.swt.layout::RowLayout

    SWT::Widgets::Button.should == org.eclipse.swt.widgets::Button
  end
end