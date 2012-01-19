
$:<< '../lib'
require 'java'

require 'rspec'

require 'shoes'

Dir["./spec/white_shoes/shared_examples/**/*.rb"].each {|f| require f}
