class Tea < ApplicationRecord
  has_many :customer_teas
  has_many :customers, through: :customer_teas

  has_many :customer_subscriptions, through: :customers
  has_many :subscriptions, through: :customer_subscriptions

  validates :title, presence: true
  validates :temperature, numericality: { only_integer: true }
end
