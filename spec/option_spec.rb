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
end
