require "spec_helper"
require "stringio"

RSpec.describe ParseGVP, "running from command line" do
  it "print usage" do
    output = run_command("")
    expect(output).to include "ParseGVP Argument Error.\n"
  end

  context "only Filename" do
    it "aaa" do
      output = run_command("spec/test_data/report.json")
      expect(output).to include "- current: 2\n"
    end
  end
end
