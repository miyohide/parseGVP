require "optparse"

module ParseGVP
  class Option
    def initialize(args)
      @args = args
      @params = {}
      @option = OptionParser.new
      @option.on("-v", "show detail result") { |v| @params[:verbose] = v }
      @option.on("-w", "show warning result") { |v| @params[:warning] = v }
      begin
        @option.parse!(@args)
      rescue OptionParser::InvalidOption
        raise "ParseGVP Argument Error."
      end
      @option.parse!(@args)
    end

    def has?(name)
      @params.include?(name)
    end

    def target
      if @args.size != 1
        raise "ParseGVP Argument Error."
      else
        @args.first
      end
    end

  end
end
