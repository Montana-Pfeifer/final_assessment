class Subscription < ApplicationRecord
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions

  has_many :customer_teas, through: :customers
  has_many :teas, through: :customer_teas

  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
