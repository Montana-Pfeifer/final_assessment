require 'rails_helper'

RSpec.describe "Teas API", type: :request do
  before :each do
    CustomerTea.delete_all
    CustomerSubscription.delete_all
    Subscription.delete_all
    Customer.delete_all
    Tea.delete_all

    @tea1 = Tea.create!(title: "Earl Grey", description: "Aromatic black tea with bergamot", temperature: 180, brew_time: "3 minutes")
    @tea2 = Tea.create!(title: "Green Tea", description: "Fresh and light green tea", temperature: 175, brew_time: "2 minutes")
  end

  describe "GET /api/v1/teas" do
    it "returns all teas" do
      get "/api/v1/teas"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:data].size).to eq(2)
      expect(json[:data].first[:attributes][:title]).to eq("Earl Grey")
    end
  end
end
