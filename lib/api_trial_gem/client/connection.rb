module ApiTrialGem
  class Client
    module Connection

      def request(http_method, path, options)
        response = self.class.send(http_method, path, { query: options } )
        data = response.parsed_response
        parse_data(data)
      end

      def parse_data(data)
        data = data.values.first
        case data
        when Hash then Resource.new(self, data)
        when Array then data.map { |hash| parse_data({resource: hash}) }
        when nil then nil
        else data
        end
      end
    end
  end
end