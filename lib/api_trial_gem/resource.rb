module ApiTrialGem
  class Resource
    attr_reader :rels, :data

    def initialize(client, data)
      data = {} unless data.is_a?(Hash)

      @client = client

      @data = data.with_indifferent_access

      links = @data.delete(:links)
      links[:self] = @data.delete(:href) if @data.has_key?(:href)

      @data = OpenStruct.new(data.with_indifferent_access)

      @rels = parse_links(links).with_indifferent_access
    end

    def parse_rels
      @data["links"].each with object({}) do |(relation ,value), result|
        result[relation]  =Relation.new(@client, value["href"])
      end
    end

    def method_missing(method_sym, *arguments, &block)
      if @data.respond_to?(method_sym)
        @data.send(method_sym)
      else
        super
      end
    end
  end
end