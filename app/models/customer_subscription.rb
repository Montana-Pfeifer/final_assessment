class CustomerSubscription < ApplicationRecord
  self.primary_key = :customer_id

  belongs_to :customer
  belongs_to :subscription

  validates :active, inclusion: { in: [true, false] }
end
