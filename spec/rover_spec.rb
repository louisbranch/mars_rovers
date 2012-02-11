require 'spec_helper'
require 'rover'

describe Rover do

  before(:each) do
    @plateau = double("plateau")
    @plateau.stub(:x).and_return((0..5))
    @plateau.stub(:y).and_return((0..5))
  end

  let(:rover) { Rover.new(@plateau, '1 2 N') }

  context "explores the Plateau" do

    it "using a set of instructions and return its final coordinates" do
      rover.explore('LMLMLMLMM').should eq('1 3 N')
    end

    it "skips invalid instructions and return its final coordinates" do
      rover.explore('LAM1LBM % L$MLMM').should eq('1 3 N')
    end

  end

end
