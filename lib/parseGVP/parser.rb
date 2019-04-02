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
      current = @json["current"]["count"]
      current_lib = @json["current"]["dependencies"].map do |i|
        %Q(  - #{i["group"]}:#{i["name"]}:#{i["version"]})
      end.join("\n")
      # FIXME exceededの詳細パターンを実装
      exceeded = @json["exceeded"]["count"]
      outdated = @json["outdated"]["count"]
      outdated_lib = @json["outdated"]["dependencies"].map do |i|
        %Q(  - #{i["group"]}:#{i["name"]})
      end.join("\n")
      # FIXME unresolvedの詳細パターンを実装
      unresolved = @json["unresolved"]["count"]
      "- current: #{current}\n#{current_lib}\n- exceeded: #{exceeded}\n- outdated: #{outdated}\n#{outdated_lib}\n- unresolved: #{unresolved}\n"
    end

    private
    def parse_json
      @json = JSON.parse(@json)
    end
  end
end
