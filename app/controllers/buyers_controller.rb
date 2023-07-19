class BuyersController < ApplicationController
  def new
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)
    if @buyer.save
      redirect_to root_path, notice: "Buyer registered successfully."
    else
      render :new
    end
  end

  # Assuming you have a route and action to handle buyer confirmations, you can update the payment status in the controller action:
def handle_buyer_confirmation
  order = Order.find(params[:order_id])
  # Logic to verify buyer confirmation and update payment status
  order.update(payment_status: true)
  # Optionally, you can send a confirmation message to the buyer after the payment status is updated.
  confirmation_message = "Your payment has been confirmed. Thank you for your purchase."
  send_confirmation_message(confirmation_message, order.buyer.contact_information)
  redirect_to order_path(order), notice: "Payment confirmed successfully."
end

  private

  def buyer_params
    params.require(:buyer).permit(:name,:location, :farmer_id)
  end
end 
