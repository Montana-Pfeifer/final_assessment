class Api::V1::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :destroy]

  def index
    subscriptions = Subscription.includes(:customers, :customer_subscriptions).all
    render json: subscriptions, include: [:customers]
  end

  def show
    render json: @subscription, include: [:customers, :customer_subscriptions, :teas]
  end

  def destroy
    @subscription.update(status: 'cancelled')
    render json: { message: "Subscription cancelled successfully" }, status: :ok
  end

  private

  def set_subscription
    @subscription = Subscription.includes(:customers, :customer_subscriptions, :teas).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Subscription not found" }, status: :not_found
  end
end

