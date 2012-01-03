Shoes.app do
  @b1 = button "Click Me" do
    debugger
    puts "I've been clicked!'"
  end
  @b2 = button "Click Me2" do
    puts "I've been clicked2!'"
  end
  @b3 = button "Click Me3" do
    puts "I've been clicked3!'"
  end

  puts "Shell is open from instance eval"
  #stack do
  #  edit_line :id => "edit"
  #
  #  button :text => "Change to Hello", :id => 'button_two' do
  #    @elements['edit'].setText("Hello")
  #  end
  #  button :text => 'Change to Goodbye', :id=>"button_three" do
  #    @elements['edit'].setText("Goodbye")
  #  end
  #end
  #
    
end
