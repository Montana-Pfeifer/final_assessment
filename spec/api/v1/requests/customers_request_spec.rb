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
    it "returns a list of customers" do
      get "/api/v1/customers"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:data]).to be_an(Array)
      expect(json[:data].size).to eq(2)

      first_customer = json[:data].first
      expect(first_customer[:attributes][:first_name]).to eq(@customer1.first_name)
      expect(first_customer[:attributes][:last_name]).to eq(@customer1.last_name)
      expect(first_customer[:attributes][:email]).to eq(@customer1.email)
    end
  end

  describe "GET /api/v1/customers/:id" do
    it "returns the customer when found" do
      get "/api/v1/customers/#{@customer1.id}"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:data][:attributes][:first_name]).to eq(@customer1.first_name)
      expect(json[:data][:attributes][:email]).to eq(@customer1.email)
    end

    it "returns an error when the customer is not found" do
      get "/api/v1/customers/9999"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(404)
      expect(json[:error]).to eq("Customer not found")
    end
  end

  describe "POST /api/v1/customers" do
    it "creates a new customer" do
      post "/api/v1/customers", params: {
        customer: {
          first_name: "Alice",
          last_name: "Smith",
          email: "alice@example.com",
          address: "789 Pine Street"
        }
      }.to_json, headers: { "CONTENT_TYPE" => "application/json" }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(201)
      expect(json[:data][:attributes][:first_name]).to eq("Alice")
      expect(json[:data][:attributes][:email]).to eq("alice@example.com")
    end

    it "returns an error when missing required fields" do
      post "/api/v1/customers", params: {
        customer: { first_name: "", email: "" }
      }.to_json, headers: { "CONTENT_TYPE" => "application/json" }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(422)
      expect(json[:error]).to include("Email can't be blank")
    end
  end
end
