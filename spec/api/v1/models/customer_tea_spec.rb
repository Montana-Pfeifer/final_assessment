require 'rails_helper'

RSpec.describe CustomerTea, type: :model do
  before(:each) do
    CustomerSubscription.delete_all
    CustomerTea.delete_all
    Subscription.delete_all
    Tea.delete_all
    Customer.delete_all
  end

  describe "Associations" do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
  end

  describe "Validations" do
    it "is valid with a rating as an integer" do
      customer = Customer.create!(first_name: "John", last_name: "Doe", email: "john.doe@example.com", address: "123 Elm Street")
      tea = Tea.create!(title: "Earl Grey", description: "Aromatic black tea with bergamot", temperature: 180, brew_time: "3 minutes")

      customer_tea = CustomerTea.new(customer: customer, tea: tea, rating: 5)
      expect(customer_tea).to be_valid
    end

    it "is valid with a nil rating" do
      customer = Customer.create!(first_name: "John", last_name: "Doe", email: "john.doe@example.com", address: "123 Elm Street")
      tea = Tea.create!(title: "Earl Grey", description: "Aromatic black tea with bergamot", temperature: 180, brew_time: "3 minutes")

      customer_tea = CustomerTea.new(customer: customer, tea: tea, rating: nil)
      expect(customer_tea).to be_valid
    end

    it "is invalid if rating is not an integer" do
      customer = Customer.create!(first_name: "John", last_name: "Doe", email: "john.doe@example.com", address: "123 Elm Street")
      tea = Tea.create!(title: "Earl Grey", description: "Aromatic black tea with bergamot", temperature: 180, brew_time: "3 minutes")

      customer_tea = CustomerTea.new(customer: customer, tea: tea, rating: 4.5) # Float instead of integer
      expect(customer_tea).not_to be_valid
      expect(customer_tea.errors[:rating]).to include("must be an integer")
    end
  end
end
