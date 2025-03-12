class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :title, :price, :status, :frequency

  has_many :customers
  has_many :teas, serializer: TeaSerializer 
  has_many :customer_subscriptions
end
