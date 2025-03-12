class Api::V1::CustomerSubscriptionsController < ApplicationController
  def create
    subscription = CustomerSubscription.new(customer_subscription_params)
    if subscription.save
      render json: { message: "Subscription created successfully", data: subscription }, status: :created
    else
      render json: { error: subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def customer_subscription_params
    params.require(:customer_subscription).permit(:customer_id, :subscription_id, :start_date, :active)
  end
end
