require 'rails_helper'

RSpec.describe Customer, type: :model do
  before(:each) do
    CustomerSubscription.delete_all
    CustomerTea.delete_all
    Customer.delete_all
  end

  describe "Validations" do
    it "is valid with a first name, last name, and unique email" do
      customer = Customer.new(
        first_name: "John",
        last_name: "Doe",
        email: "john.doe@example.com"
      )
      expect(customer).to be_valid
    end

    it "is invalid without an email" do
      customer = Customer.new(first_name: "John", last_name: "Doe", email: nil)
      expect(customer).not_to be_valid
      expect(customer.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email" do
      Customer.create!(first_name: "John", last_name: "Doe", email: "duplicate@example.com")
      duplicate_customer = Customer.new(first_name: "Jane", last_name: "Smith", email: "duplicate@example.com")

      expect(duplicate_customer).not_to be_valid
      expect(duplicate_customer.errors[:email]).to include("has already been taken")
    end
  end

  describe "Associations" do
    it { should have_many(:customer_teas) }
    it { should have_many(:teas).through(:customer_teas) }
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:subscriptions).through(:customer_subscriptions) }
  end
end
