require 'rails_helper'

RSpec.describe "Customers API", type: :request do
  before :each do
    CustomerTea.delete_all
    CustomerSubscription.delete_all
    Subscription.delete_all
    Customer.delete_all
    Tea.delete_all

    @customer1 = Customer.create!(first_name: "John", last_name: "Doe", email: "john@example.com", address: "123 Elm Street")
    @customer2 = Customer.create!(first_name: "Jane", last_name: "Doe", email: "jane@example.com", address: "456 Oak Avenue")
  end

  describe "GET /api/v1/customers" do
    it "returns all customers" do
      get "/api/v1/customers"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:data].size).to eq(2)
      expect(json[:data].first[:attributes][:first_name]).to eq("John")
    end
  end
end
