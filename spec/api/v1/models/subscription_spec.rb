require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "Validations" do
    it "is valid with a title and a positive price" do
      subscription = Subscription.new(title: "Monthly Tea Subscription", price: 19.99, status: "active", frequency: "Monthly")
      expect(subscription).to be_valid
    end

    it "is invalid without a title" do
      subscription = Subscription.new(title: nil, price: 19.99)
      expect(subscription).not_to be_valid
      expect(subscription.errors[:title]).to include("can't be blank")
    end

    it "is invalid with a negative price" do
      subscription = Subscription.new(title: "Premium Tea Subscription", price: -5.00)
      expect(subscription).not_to be_valid
      expect(subscription.errors[:price]).to include("must be greater than or equal to 0")
    end
  end

  describe "Associations" do
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:customers).through(:customer_subscriptions) }
    it { should have_many(:customer_teas).through(:customers) }
    it { should have_many(:teas).through(:customer_teas) }
  end
end