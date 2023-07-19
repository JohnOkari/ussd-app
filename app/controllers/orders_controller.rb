class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      # Add logic to generate the order confirmation and handle buyer confirmations here
      redirect_to order_path(@order), notice: "Order placed successfully."
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :delivery_address).merge(buyer_id: current_buyer.id, product_id: params[:product_id])
  end
end
