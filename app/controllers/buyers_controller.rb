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
  private

  def buyer_params
    params.require(:buyer).permit(:name,:location, :farmer_id)
  end
end 
