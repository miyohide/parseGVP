require "json"

module ParseGVP
  class Parser
    def call(json)
      @json = json

      parse_json
    end

    def simple_result
      current = @json["current"]["count"]
      exceeded = @json["exceeded"]["count"]
      outdated = @json["outdated"]["count"]
      unresolved = @json["unresolved"]["count"]
      "current: #{current}, exceeded: #{exceeded}, outdated: #{outdated}, unresolved: #{unresolved}"
    end

    def detail_result
      results = []
      ["current", "exceeded", "outdated", "unresolved"].each do |item|
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
      "  - #{libname(item)}:#{item['version']}"
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
