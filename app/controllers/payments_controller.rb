class PaymentsController < ApplicationController
    def show
      @payment = Payment.find(params[:id])
    end
  
    def create
      @payment = Payment.new(payment_params)
      if @payment.save
        # Add logic to handle payment processing here
        redirect_to payment_path(@payment), notice: "Payment processed successfully."
      else
        render :new
      end
    end
  
    private
  
    def payment_params
      params.require(:payment).permit(:amount, :payment_status, :payment_date).merge(order_id: params[:order_id])
    end
  end
  