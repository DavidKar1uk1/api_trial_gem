require "api_trial_gem/client/tickets"
require "httparty"

module ApiTrialGem
  class Client
    include HTTParty
    include ApiTrialGem::Client::Tickets

    base_uri "http://localhost:3000/api/financial/private/financial_transactions"
    format :json

    def initialize(access_token = nil)
      @access_token = access_token || ENV["APITRIALGEM_ACCESS_TOKEN"]
    end

    # def perform_request(path)
    #   url = "http://localhost:3000/api/financial/private/financial_transactions/#{path}"
    #   response = HTTParty.get(url, headers: { 'Authorization' => "Bearer #{@access_token}" })
    #   JSON.parse(response.body)
    # end


  end
end