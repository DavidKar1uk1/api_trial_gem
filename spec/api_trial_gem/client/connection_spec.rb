require 'spec/spec_helper'

describe ApiTrialGem::Client::Connection do

  let(:client) { ApiTrialGem::Client.new("phantogram") }
  let(:api_trial_url) { "http://localhost:3000/api/financial/private/financial_transactions" }

  context "nested hash as response with single root key" do
    let(:response) do
      {
          ticket: {
              number: 1,
              summary: "This is the first 100 characters of the first message...",
              links: {
                  assignee: {
                      href: "http://localhost:3000/api/financial/private/financial_transactions"
                  }
              }
          }
      }.to_json
    end


    before(:each) do
      stub_request(:get, "https://api.groovehq.com/v1/tickets/1").to_return(body: response)
    end

    it "returns resource for single root key" do
      expect(client.get("/tickets/1")).to be_instance_of(ApiTrialGem::Resource)
    end

    it "returns resource with correct relations" do
      expect(client.get("/tickets/1").rels[:assignee].href).to eql("http://localhost:3000/api/financial/private/financial_transactions")
    end
  end
end