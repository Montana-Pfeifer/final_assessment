require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe "Validations" do
    it "is valid with a title and an integer temperature" do
      tea = Tea.new(title: "Earl Grey", temperature: 180)
      expect(tea).to be_valid
    end

    it "is invalid without a title" do
      tea = Tea.new(title: nil, temperature: 180)
      expect(tea).not_to be_valid
      expect(tea.errors[:title]).to include("can't be blank")
    end

    it "is invalid with a non-integer temperature" do
      tea = Tea.new(title: "Green Tea", temperature: 180.5)
      expect(tea).not_to be_valid
      expect(tea.errors[:temperature]).to include("must be an integer")
    end
  end

  describe "Associations" do
    it { should have_many(:customer_teas) }
    it { should have_many(:customers).through(:customer_teas) }
    it { should have_many(:customer_subscriptions).through(:customers) }
    it { should have_many(:subscriptions).through(:customer_subscriptions) }
  end
end
