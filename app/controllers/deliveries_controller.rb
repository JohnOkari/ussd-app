class DeliveriesController < ApplicationController
    def show
      @delivery = Delivery.find(params[:id])
    end
  
    def create
      @delivery = Delivery.new(delivery_params)
      if @delivery.save
        # Add logic to coordinate delivery between buyers and farmers here
        redirect_to delivery_path(@delivery), notice: "Delivery coordinated successfully."
      else
        render :new
      end
    end
  
    private
  
    def delivery_params
      params.require(:delivery).permit(:status, :delivery_date, :delivery_address).merge(order_id: params[:order_id])
    end
  end
  