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
      results << %Q(- current: #{@json["current"]["count"]})
      results << @json["current"]["dependencies"].map do |i|
        %Q(  - #{i["group"]}:#{i["name"]}:#{i["version"]})
      end.join("\n")
      results << %Q(- exceeded: #{@json["exceeded"]["count"]})
      results << lib_details("exceeded")
      results << %Q(- outdated: #{@json["outdated"]["count"]})
      results << lib_details("outdated")
      results << %Q(- unresolved: #{@json["unresolved"]["count"]})
      results << lib_details("unresolved")
      results.delete_if(&:empty?).join("\n") + "\n"
    end

    def lib_details(type)
      @json[type]["dependencies"].map do |i|
        lib_detail(i)
      end.join("\n")
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
