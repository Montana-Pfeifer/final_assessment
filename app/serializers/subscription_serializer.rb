class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :title, :price, :status, :frequency

  has_many :customers, serializer: CustomerSerializer
  has_many :teas, serializer: TeaSerializer
  has_many :customer_subscriptions, serializer: CustomerSubscriptionSerializer
end
