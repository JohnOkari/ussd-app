class PaymentsController < ApplicationController
    def show
      @payment = Payment.find(params[:id])
    end
  
    def create
      @payment = Payment.new(payment_params)
      if @payment.save
        # Add logic to handle payment processing here
        order = @payment.order
        buyer = order.buyer
        payment_amount = @payment.amount
  
        # Perform the payment processing using your chosen payment gateway or provider.
        # For example, if you are using a hypothetical 'PaymentGateway' class:
        payment_gateway = PaymentGateway.new
        if payment_gateway.process_payment(buyer, payment_amount)
          # Payment successful
          @payment.update(payment_status: "Paid", payment_date: Time.now)
          redirect_to payment_path(@payment), notice: "Payment processed successfully."
        else
          # Payment failed
          @payment.update(payment_status: "Failed", payment_date: Time.now)
          redirect_to payment_path(@payment), alert: "Payment processing failed. Please try again or contact customer support."
        end
      else
        render :new
      end
    end
  
    private
  
    def payment_params
      params.require(:payment).permit(:amount, :payment_status, :payment_date).merge(order_id: params[:order_id])
    end
  end
  