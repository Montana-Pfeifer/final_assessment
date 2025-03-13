RSpec.describe "CustomerSubscriptions API", type: :request do
  before :each do
    CustomerSubscription.delete_all
    Subscription.delete_all
    Customer.delete_all
    Tea.delete_all

    @customer1 = Customer.create!(first_name: "John", last_name: "Doe", email: "john@example.com", address: "123 Elm Street")
    @subscription1 = Subscription.create!(title: "Monthly Tea Subscription", price: 19.99, status: "active", frequency: "Monthly")
  end

  describe "POST /api/v1/customer_subscriptions" do
    it "creates a new customer subscription when all required attributes are provided" do
      post "/api/v1/customer_subscriptions", 
        params: {
          customer_subscription: {
            customer_id: @customer1.id,
            subscription_id: @subscription1.id,
            active: true
          }
        }.to_json, 
        headers: { "CONTENT_TYPE" => "application/json" }

      json = JSON.parse(response.body, symbolize_names: true)
      puts "🔍 Response JSON: #{json.inspect}"

      expect(response).to have_http_status(201)
      expect(json[:data]).not_to be_nil
      expect(json[:data][:attributes][:active]).to be true
    end

    it "returns an error if customer_id is missing" do
      post "/api/v1/customer_subscriptions", 
        params: {
          customer_subscription: {
            subscription_id: @subscription1.id,
            active: true
          }
        }.to_json, 
        headers: { "CONTENT_TYPE" => "application/json" }

      json = JSON.parse(response.body, symbolize_names: true)
      puts "🔍 Response JSON: #{json.inspect}"

      expect(response).to have_http_status(422)
      expect(json[:error]).to include("Customer must exist")
    end

    it "returns an error if subscription_id is missing" do
      post "/api/v1/customer_subscriptions", 
        params: {
          customer_subscription: {
            customer_id: @customer1.id,
            active: true
          }
        }.to_json, 
        headers: { "CONTENT_TYPE" => "application/json" }

      json = JSON.parse(response.body, symbolize_names: true)
      puts "🔍 Response JSON: #{json.inspect}"

      expect(response).to have_http_status(422)
      expect(json[:error]).to include("Subscription must exist")
    end

    it "returns an error if active status is missing" do
      post "/api/v1/customer_subscriptions", 
        params: {
          customer_subscription: {
            customer_id: @customer1.id,
            subscription_id: @subscription1.id
          }
        }.to_json, 
        headers: { "CONTENT_TYPE" => "application/json" }

      json = JSON.parse(response.body, symbolize_names: true)
      puts "🔍 Response JSON: #{json.inspect}"

      expect(response).to have_http_status(422)
      expect(json[:error]).to include("Active is not included in the list")
    end
  end
end

