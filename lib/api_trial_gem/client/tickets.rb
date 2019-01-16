module ApiTrialGem
  class Client
    module Tickets
      def tickets(options = {})
        # response = self.class.get("/tickets", { query: options } )
        # response.parsed_response["tickets"]
        get("/tickets/#{ticket_number}", { query: options })
      end
    end
  end
end