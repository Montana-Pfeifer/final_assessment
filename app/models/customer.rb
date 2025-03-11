class Customer < ApplicationRecord
  has_many :customer_teas
  has_many :teas, through: :customer_teas

  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions

  validates :email, presence: true, uniqueness: true
end
