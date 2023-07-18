class FarmerResponsesController < ApplicationController
    def new
      @farmer_response = FarmerResponse.new
    end
  
    def create
      @farmer_response = FarmerResponse.new(farmer_response_params)
      if @farmer_response.save
        # Add logic to facilitate communication with buyers and update order details here
        redirect_to root_path, notice: "Farmer response sent successfully."
      else
        render :new
      end
    end
  
    private
  
    def farmer_response_params
      params.require(:farmer_response).permit(:message).merge(farmer_id: current_farmer.id)
    end
  end