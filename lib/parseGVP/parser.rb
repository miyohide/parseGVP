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
      results << count_line("current")
      results << lib_details("current")
      results << count_line("exceeded")
      results << lib_details("exceeded")
      results << count_line("outdated")
      results << lib_details("outdated")
      results << count_line("unresolved")
      results << lib_details("unresolved")
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
      "  - #{item['group']}:#{item['name']}:#{item['version']}"
    end

    def lib_detail(item)
      "  - #{item['group']}:#{item['name']}"
    end

    private
    def parse_json
      @json = JSON.parse(@json)
    end
  end
end
