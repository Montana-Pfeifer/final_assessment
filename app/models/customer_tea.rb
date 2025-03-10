class CustomerTea < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates :rating, numericality: { only_integer: true, allow_nil: true }
end
