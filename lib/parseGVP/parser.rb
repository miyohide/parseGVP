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
      results << @json["exceeded"]["dependencies"].map do |i|
        %Q(  - #{i["group"]}:#{i["name"]})
      end.join("\n")
      results << %Q(- outdated: #{@json["outdated"]["count"]})
      results << @json["outdated"]["dependencies"].map do |i|
        %Q(  - #{i["group"]}:#{i["name"]})
      end.join("\n")
      results << %Q(- unresolved: #{@json["unresolved"]["count"]})
      results << @json["unresolved"]["dependencies"].map do |i|
        %Q(  - #{i["group"]}:#{i["name"]})
      end.join("\n")
      results.delete_if(&:empty?).join("\n") + "\n"
    end

    private
    def parse_json
      @json = JSON.parse(@json)
    end
  end
end
