require_relative 'spec_helper'
require 'shoes/shape'

describe Shoes::Shape do
  it_behaves_like "object with stroke"
  it_behaves_like "object with style"
end
