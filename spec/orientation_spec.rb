require 'spec_helper'
require 'orientation'

describe Orientation do

  context "direction" do

    it "is a Cardinal Point (N, E, S, W)" do
      orientation = Orientation.new('N')
      orientation.should respond_to(:direction)
    end

    it "raises an error when it is not a valid Cardinal Point" do
      expect { Orientation.new('A') }.to raise_error("Invalid direction")
    end

  end

  context "when it is facing North" do

    let(:orientation) { Orientation.new('N') }

    it "rotates 90 degrees to go East" do
      orientation.rotate(90).should eq('E')
    end

    it "rotates -90 degrees to go West" do
      orientation.rotate(-90).should eq('W')
    end

  end

  context "when it is facing East" do

    let(:orientation) { Orientation.new('E') }

    it "rotates 90 degrees to go South" do
      orientation.rotate(90).should eq('S')
    end

    it "rotates -90 degrees to go North" do
      orientation.rotate(-90).should eq('N')
    end

  end

  context "when it is facing South" do

    let(:orientation) { Orientation.new('S') }

    it "rotates 90 degrees to go West" do
      orientation.rotate(90).should eq('W')
    end

    it "rotates -90 degrees to go East" do
      orientation.rotate(-90).should eq('E')
    end

  end

  context "when it is facing West" do

    let(:orientation) { Orientation.new('W') }

    it "rotates 90 degrees to go North" do
      orientation.rotate(90).should eq('N')
    end

    it "rotates -90 degrees to go South" do
      orientation.rotate(-90).should eq('S')
    end

  end


end
