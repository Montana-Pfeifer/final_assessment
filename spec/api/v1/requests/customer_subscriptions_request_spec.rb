require 'rails_helper'

RSpec.describe "CustomerSubscriptions API", type: :request do
  before :each do
    CustomerTea.delete_all
    CustomerSubscription.delete_all
    Subscription.delete_all
    Customer.delete_all
    Tea.delete_all

    @tea1 = Tea.create!(title: "Earl Grey", description: "Aromatic black tea with bergamot", temperature: 180, brew_time: "3 minutes")
    @tea2 = Tea.create!(title: "Green Tea", description: "Fresh and light green tea", temperature: 175, brew_time: "2 minutes")

    @customer1 = Customer.create!(first_name: "John", last_name: "Doe", email: "john@example.com", address: "123 Elm Street")
    @customer2 = Customer.create!(first_name: "Jane", last_name: "Doe", email: "jane@example.com", address: "456 Oak Avenue")

    @subscription1 = Subscription.create!(title: "Monthly Tea Subscription", price: 19.99, status: "active", frequency: "Monthly")
    @subscription2 = Subscription.create!(title: "Weekly Tea Subscription", price: 9.99, status: "active", frequency: "Weekly")

    CustomerSubscription.create!(customer: @customer1, subscription: @subscription1, start_date: "2025-03-01", active: true)
    CustomerSubscription.create!(customer: @customer2, subscription: @subscription2, start_date: "2025-03-05", active: true)
  end

  describe "POST /api/v1/customer_subscriptions" do
    it "creates a new customer subscription" do
      post "/api/v1/customer_subscriptions", params: {
        customer_id: @customer1.id,  # ✅ FIXED
        subscription_id: @subscription2.id,  # ✅ FIXED
        start_date: "2025-04-01",
        active: true
      }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(201)
      expect(json[:data][:attributes][:start_date]).to eq("2025-04-01")
      expect(json[:data][:attributes][:active]).to be true
    end

    it "returns an error if parameters are missing" do
      post "/api/v1/customer_subscriptions", params: {}

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(422)
      expect(json[:errors]).to include("Customer must exist", "Subscription must exist")
    end
  end
end
