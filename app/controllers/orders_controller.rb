class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      # Generate order confirmation message
      confirmation_message = "Thank you for your order. Order details: Product: #{order.product.name}, Quantity: #{order.quantity}, Delivery Address: #{order.delivery_address}."
      # Send the confirmation message to the buyer via SMS or USSD
      send_confirmation_message(confirmation_message, order.buyer.contact_information)
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
