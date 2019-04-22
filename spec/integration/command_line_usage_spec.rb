require "spec_helper"
require "stringio"

RSpec.describe ParseGVP, "running from command line" do
  context "引数なしの場合" do
    it "使い方の説明を出力すること" do
      output = run_command("")
      expect(output).to include "ParseGVP Argument Error.\n"
    end
  end

  context "ファイル名だけ指定している場合" do
    it "詳細な結果が出力されること" do
      output = run_command("spec/test_data/report.json")
      expect(output).to include "- current: 2\n"
    end
  end
end
