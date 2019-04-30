require 'spec_helper'

RSpec.describe ParseGVP::Option do
  context "argument is empty" do
    before do
      @opt = ParseGVP::Option.new([])
    end

    it "has?(:verbose) return false" do
      expect(@opt.has?(:verbose)).to eq false
    end

    it "target raise exception" do
      expect { @opt.target }.to raise_error("ParseGVP Argument Error.")
    end
  end

  context "argument have v option" do
    before do
      @opt = ParseGVP::Option.new(["-v", "targetfile"])
    end

    it "#has?(:verbose) return true" do
      expect(@opt.has?(:verbose)).to eq true
    end

    it "#target return targetfile" do
      expect(@opt.target).to eq "targetfile"
    end
  end

  context "option does not support" do
    it "raise exception" do
      expect { ParseGVP::Option.new(["-a", "targetfile"]) }.to raise_error("ParseGVP Argument Error.")
    end
  end
end
