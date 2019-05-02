require "json"

# Gradle Versions Pluginが出力するJSONを解析する
module ParseGVP
  # Gradle Versions Pluginが出力するJSONを解析する
  class Parser
    def initialize(filename)
      @filename = filename
    end

    def json_data
      File.open(@filename).read
    end

    def call
      @json = json_data

      parse_json
    end

    def simple_result
      ["current", "exceeded", "outdated", "unresolved"].map do |item|
        "#{item}: #{@json[item]['count']}"
      end.join(", ")
    end

    def detail_result
      results = []
      ["current", "exceeded", "outdated", "unresolved"].each do |item|
        results << count_line(item)
        results << lib_details(item)
      end
      results.delete_if(&:empty?).join("\n") + "\n"
    end

    def warning_result
      results = []
      ["exceeded", "outdated", "unresolved"].each do |item|
        results << count_line(item)
        results << lib_details(item)
      end
      results.delete_if(&:empty?).join("\n") + "\n"
    end

    def count_line(type)
      "- #{type}: #{@json[type]['count']}"
    end

    def lib_details(type)
      @json[type]["dependencies"].map do |i|
        case type
        when "current"
          lib_current_detail(i)
        else
          lib_detail(i)
        end
      end.join("\n")
    end

    def lib_current_detail(item)
      "  - #{libname(item)}:#{current_version(item)}"
    end

    def lib_detail(item)
      "  - [#{libname(item)}](#{url(item)}) (#{current_version(item)} -> #{new_version(item)})"
    end

    private
    def parse_json
      @json = JSON.parse(@json)
    end

    def libname(item)
      "#{item['group']}:#{item['name']}"
    end

    def current_version(item)
      item['version']
    end

    def new_version(item)
      item['available']['milestone']
    end

    def url(item)
      item['projectUrl']
    end
  end
end
