class Tea < ApplicationRecord
  has_many :customer_teas
  has_many :customers, through: :customer_teas

  validates :title, presence: true
  validates :temperature, numericality: { only_integer: true }
end
