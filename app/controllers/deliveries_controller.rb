class DeliveriesController < ApplicationController
    def show
      @delivery = Delivery.find(params[:id])
    end
  
    def create
      @delivery = Delivery.new(delivery_params)
      if @delivery.save
        # Add logic to coordinate delivery between buyers and farmers here
        order = @delivery.order
        buyer = order.buyer
        farmer = order.product.farmer
  
        # Notify the buyer and farmer about the delivery details
        buyer_notification = "Your order will be delivered on #{delivery.delivery_date} to #{delivery.delivery_address}."
        farmer_notification = "You have an order for delivery on #{delivery.delivery_date} to #{delivery.delivery_address}."
  
        # Use your SMS or USSD service provider's API to send the notifications to the buyer and farmer
        send_notification_to_buyer(buyer, buyer_notification)
        send_notification_to_farmer(farmer, farmer_notification)
  
        redirect_to delivery_path(@delivery), notice: "Delivery coordinated successfully."
      else
        render :new
      end
    end
  
    private
  
    def delivery_params
      params.require(:delivery).permit(:status, :delivery_date, :delivery_address).merge(order_id: params[:order_id])
    end
  
    def send_notification_to_buyer(buyer, message)
      # Implement the logic to send the notification message to the buyer.
      # Use your SMS or USSD service provider's API here to send the message to the buyer's contact information.
      # For example, if the buyer's contact information is stored in a 'contact_information' attribute of the Buyer model:
      # sms_service.send_sms(buyer.contact_information, message)
      # Note: The above line is just a placeholder; you need to use the actual API provided by your SMS or USSD service provider.
    end
  
    def send_notification_to_farmer(farmer, message)
      # Implement the logic to send the notification message to the farmer.
      # Use your SMS or USSD service provider's API here to send the message to the farmer's contact information.
      # For example, if the farmer's contact information is stored in a 'contact_information' attribute of the Farmer model:
      # sms_service.send_sms(farmer.contact_information, message)
      # Note: The above line is just a placeholder; you need to use the actual API provided by your SMS or USSD service provider.
    end
  end
  