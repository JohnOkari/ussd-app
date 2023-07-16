class BuyerRequestsController < ApplicationController
    def index
      @buyer_requests = BuyerRequest.all
    end
  
    def new
      @buyer_request = BuyerRequest.new
    end
  
    def create
      @buyer_request = BuyerRequest.new(buyer_request_params)
      if @buyer_request.save
        # Add logic to search for matching farmers and send notifications here
        redirect_to buyer_requests_path, notice: "Buyer request created successfully."
      else
        render :new
      end
    end
  
    private
  
    def buyer_request_params
      params.require(:buyer_request).permit(:product, :quantity, :other_details).merge(buyer_id: current_buyer.id)
    end
  end
  