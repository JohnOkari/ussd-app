class BuyerRequestsController < ApplicationController
  def new
    @buyer_request = BuyerRequest.new
  end

  def create
    @buyer_request = BuyerRequest.new(buyer_request_params)
    if @buyer_request.save
      # Add logic to search for matching farmers and send notifications here
      matching_farmers = find_matching_farmers(@buyer_request.product, @buyer_request.quantity)
      send_notifications_to_farmers(matching_farmers, @buyer_request)

      redirect_to buyer_requests_path, notice: "Buyer request created successfully."
    else
      render :new
    end
  end

  private

  def buyer_request_params
    params.require(:buyer_request).permit(:product, :quantity, :other_details).merge(buyer_id: current_buyer.id)
  end

  def find_matching_farmers(product, quantity)
    # Implement the logic to find farmers who offer the requested product and quantity.
    # You may use any algorithm or database queries that suit your application's requirements.
    # For example:
    Farmer.joins(:products).where(products: { name: product }).where("products.quantity >= ?", quantity)
  end

  def send_notifications_to_farmers(farmers, buyer_request)
    # Loop through the matching farmers and send notifications to each of them.
    # Use your SMS or USSD service provider's API to send the notifications.
    # You can compose a message with the buyer request details and send it to each farmer.
    notification_message = "New buyer request: Product: #{buyer_request.product}, Quantity: #{buyer_request.quantity}, Other details: #{buyer_request.other_details}."
    farmers.each do |farmer|
      send_notification_to_farmer(farmer, notification_message)
    end
  end

  def send_notification_to_farmer(farmer, message)
    # Implement the logic to send the notification message to the farmer.
    # Use your SMS or USSD service provider's API here to send the message to the farmer's contact information.
    # For example, if the farmer's contact information is stored in a 'contact_information' attribute of the Farmer model:
    # sms_service.send_sms(farmer.contact_information, message)
    # Note: The above line is just a placeholder; you need to use the actual API provided by your SMS or USSD service provider.
  end
end
