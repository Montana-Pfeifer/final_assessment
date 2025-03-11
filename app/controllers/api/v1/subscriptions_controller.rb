class Api::V1::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :destroy]

  def index
    subscriptions = Subscription.includes(:customers, :customer_subscriptions).all
    render json: SubscriptionSerializer.new(subscriptions).serializable_hash
  end

  def show
    render json: SubscriptionSerializer.new(@subscription).serializable_hash
  end

  def destroy
    subscription = Subscription.find(params[:id])
    subscription.update(status: 'cancelled')
  
    head :no_content
  end
  

  private

  def set_subscription
    @subscription = Subscription.includes(:customers, :customer_subscriptions, :teas).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Subscription not found" }, status: :not_found
  end
end
