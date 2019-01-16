require "api_trial_gem/client/connection"
require "api_trial_gem/client/agents"
require "api_trial_gem/client/customers"
require "api_trial_gem/client/folders"
require "api_trial_gem/client/groups"
require "api_trial_gem/client/mailboxes"
require "api_trial_gem/client/attachments"
require "api_trial_gem/client/messages"
require "api_trial_gem/client/tickets"
require "api_trial_gem/client/webhooks"

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