class Api::V1::Contact::OrdersController < ApplicationController
  include TokenAuthenticatable
  skip_before_action :authenticate_user, only: :create

  def index
    render json: Contact::Order.all
  end

  def create
    @order = Contact::Order.new(order_params)
    if @order.save
      ContactOrderMailer.send_order_notification(@order).deliver if Rails.env.production?
      render json: @order, status: 200
    else
      render json: { error: @order.errors.full_messages }
    end

  end

  private

  def order_params
    params.require(:order).permit(:name, :message, :email)
  end
end