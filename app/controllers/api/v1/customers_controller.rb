class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: [:show]

  def index
    customers = Customer.all
    render json: CustomerSerializer.new(customers)
  end

  def show
    render json: CustomerSerializer.new(@customer)
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      render json: CustomerSerializer.new(customer), status: :created
    else
      render json: { error: customer.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  private

  def set_customer
    @customer = Customer.find_by(id: params[:id])
    render json: { error: "Customer not found" }, status: :not_found unless @customer
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :address)
  end
end
