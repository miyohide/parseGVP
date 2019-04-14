module Helpers
  def run_command(arguments)
    command = "#{File.dirname(__FILE__ )}/../../exe/gvp_parser"
    arguments = arguments.join(" ") if arguments.is_a?(Array)

    output = []
    IO.popen("#{command} #{arguments} 2>&1") do |pipe|
      output = pipe.readlines
    end
    output
  end
end
