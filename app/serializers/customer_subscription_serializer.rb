class CustomerSubscriptionSerializer
  include JSONAPI::Serializer
  attributes :start_date, :active
  belongs_to :customer, serializer: CustomerSerializer
  belongs_to :subscription, serializer: SubscriptionSerializer
end
