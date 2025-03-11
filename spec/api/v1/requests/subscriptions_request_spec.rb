require 'rails_helper'

RSpec.describe "Subscriptions API", type: :request do
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

    CustomerTea.create!(customer: @customer1, tea: @tea1, rating: 5, favorite: true, review: "Excellent tea!")
    CustomerTea.create!(customer: @customer2, tea: @tea2, rating: 4, favorite: false, review: "Too strong for me.")
  end

  describe "GET /api/v1/subscriptions" do
    it "returns all subscriptions with customers" do
      get '/api/v1/subscriptions'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data].length).to eq(2)
      expect(json[:data].first[:attributes][:title]).to eq("Monthly Tea Subscription")
      expect(json[:data].first[:relationships][:customers][:data].length).to eq(1)
    end
  end

  describe "GET /api/v1/subscriptions/:id" do
    it "returns a specific subscription with customers and teas" do
      get "/api/v1/subscriptions/#{@subscription1.id}"

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data][:attributes][:title]).to eq("Monthly Tea Subscription")
      expect(json[:data][:relationships][:customers][:data].length).to eq(1)
    end
  end

  describe "DELETE /api/v1/subscriptions/:id" do
    it "cancels a subscription" do
      delete "/api/v1/subscriptions/#{@subscription1.id}"

      expect(response).to have_http_status(204)
      expect(Subscription.find(@subscription1.id).status).to eq("cancelled")
    end
  end
end
