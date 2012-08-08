require 'spec_helper'
require 'navigator'

describe Navigator do

  before(:each) do
    @plateau = double("plateau")
    @plateau.stub(:x).and_return((0..5))
    @plateau.stub(:y).and_return((0..5))
  end

  context "landing coordinates" do

    it "is inside the Plateau limits" do
      expect { Navigator.new(@plateau,6,1,'N') }.to raise_error("Invalid landing coordinates")
    end

    it "raises an error when it is outside the Plateau limits" do
      expect { Navigator.new(@plateau,6,1,'N') }.to raise_error("Invalid landing coordinates")
    end

  end

  context "when it is facing North" do

    let(:navigator) { Navigator.new(@plateau,0,0,'N') }

    it "moves one step into the y axis" do
      navigator.move('M').should eq('0 1 N')
    end

    it "turns right to go East" do
      navigator.move('R').should eq('0 0 E')
    end

    it "turns left to go West" do
      navigator.move('L').should eq('0 0 W')
    end

  end

  context "when it is facing East" do

    let(:navigator) { Navigator.new(@plateau,0,0,'E') }

    it "moves one step into the x axis" do
      navigator.move('M').should eq('1 0 E')
    end

    it "turns right to go South" do
      navigator.move('R').should eq('0 0 S')
    end

    it "turns left to North" do
      navigator.move('L').should eq('0 0 N')
    end

  end

  context "when it is facing South" do

    let(:navigator) { Navigator.new(@plateau,1,1,'S') }

    it "moves one step into the y axis" do
      navigator.move('M').should eq('1 0 S')
    end

    it "turns right to go West" do
      navigator.move('R').should eq('1 1 W')
    end

    it "turns left to East" do
      navigator.move('L').should eq('1 1 E')
    end

  end

  context "when it is facing West" do

    let(:navigator) { Navigator.new(@plateau,1,1,'W') }

    it "moves one step into the x axis" do
      navigator.move('M').should eq('0 1 W')
    end

    it "turns right to go North" do
      navigator.move('R').should eq('1 1 N')
    end

    it "turns left to South" do
      navigator.move('L').should eq('1 1 S')
    end

  end

  it "raises an error when it moves to outside Plateau limits" do
    navigator = Navigator.new(@plateau,5,5,'N')
    expect { navigator.move('M') }.to raise_error("Invalid instruction, coordinate doesn't exist")
  end

end
