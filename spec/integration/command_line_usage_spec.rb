require "spec_helper"

RSpec.describe ParseGVP, "running from command line" do
  it "print usage" do
    output = run_command("")
    expect(output).to include "ParseGVP Argument Error.\n"
  end
end
