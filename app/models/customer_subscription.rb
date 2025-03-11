class CustomerSubscription < ApplicationRecord
  self.primary_key = :customer_id
  
  belongs_to :customer
  belongs_to :subscription

  validates :start_date, presence: true
  validates :active, inclusion: { in: [true, false] }
end
