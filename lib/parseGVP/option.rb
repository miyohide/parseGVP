require "optparse"

module ParseGVP
  class Option
    def initialize
      @params = {}
      @option = OptionParser.new
      @option.on("-v", "show detail result") { |v| @params[:verbose] = v }
      @option.parse!(ARGV)
    end

    def has?(name)
      @params.include?(name)
    end

    def target
      if ARGV.size != 1
        raise "ParseGVP Argument Error."
      else
        ARGV.first
      end
    end

  end
end
