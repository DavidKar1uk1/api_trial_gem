require '../spec_helper'

describe ApiTrialGem::Resource do
  let(:client) { ApiTrialGem::Client.new("phantogram") }

  it "returns empty data for invalid input" do
    resource = ApiTrialGem::Resource.new(client, "")
    expect(resource.data).to eql({})
  end

  it "parses relations correctly" do
    data = {
        links: {
            assignee: {
                href: "http://localhost:3000/api/financial/private/financial_transactions"
            }
        }
    }
    resource = ApiTrialGem::Resource.new(client, data)
    expect(resource.rels[:assignee]).to be_instance_of(ApiTrialGem::Relation)
  end

  it "parses self relation correctly" do
    data = {
        href: "http://localhost:3000/api/financial/private/financial_transactions"
    }
    resource = ApiTrialGem::Resource.new(client, data)
    expect(resource.rels[:self]).to be_instance_of(ApiTrialGem::Relation)
  end

  it "parses data correctly" do
    data = {
        name: "When I am small"
    }
    resource = ApiTrialGem::Resource.new(client, data)
    expect(resource.data[:name]).to eql "When I am small"
  end
end