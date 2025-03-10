class Subscription < ApplicationRecord
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions

  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
