require 'spec_helper'
require 'plateau'

describe Plateau do

  let(:plateau) { Plateau.new(5,5) }

  it "has a horizontal axis" do
    plateau.x.should eq(0..5)
  end

  it "has a vertical axis" do
    plateau.y.should eq(0..5)
  end

end
