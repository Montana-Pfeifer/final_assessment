require 'rails_helper'

RSpec.describe CustomerSubscription, type: :model do
  before(:each) do
    CustomerSubscription.delete_all
    CustomerTea.delete_all
    Subscription.delete_all
    Tea.delete_all
    Customer.delete_all
  end

  describe "Associations" do
    it { should belong_to(:customer) }
    it { should belong_to(:subscription) }
  end
  
  describe "Validations" do
    it "is valid with a start_date and an active status" do
      customer = Customer.create!(first_name: "John", last_name: "Doe", email: "john.doe@example.com", address: "123 Elm Street")
      subscription = Subscription.create!(title: "Monthly Tea Subscription", price: 19.99, status: "active", frequency: "Monthly")

      customer_subscription = CustomerSubscription.new(customer: customer, subscription: subscription, start_date: Date.today, active: true)
      expect(customer_subscription).to be_valid
    end

    it "is invalid without a start_date" do
      customer = Customer.create!(first_name: "John", last_name: "Doe", email: "john.doe@example.com", address: "123 Elm Street")
      subscription = Subscription.create!(title: "Monthly Tea Subscription", price: 19.99, status: "active", frequency: "Monthly")

      customer_subscription = CustomerSubscription.new(customer: customer, subscription: subscription, start_date: nil, active: true)
      expect(customer_subscription).not_to be_valid
      expect(customer_subscription.errors[:start_date]).to include("can't be blank")
    end

    it "is invalid if active is not true or false" do
      customer = Customer.create!(first_name: "John", last_name: "Doe", email: "john.doe@example.com", address: "123 Elm Street")
      subscription = Subscription.create!(title: "Monthly Tea Subscription", price: 19.99, status: "active", frequency: "Monthly")

      customer_subscription = CustomerSubscription.new(customer: customer, subscription: subscription, start_date: Date.today, active: nil)
      expect(customer_subscription).not_to be_valid
      expect(customer_subscription.errors[:active]).to include("is not included in the list")
    end
  end
end