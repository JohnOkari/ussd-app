class FarmersController < ApplicationController
  def new
    @farmer = Farmer.new
  end

  def create
    @farmer = Farmer.new(farmer_params)
    if @farmer.save
      redirect_to root_path, notice: "Farmer registered successfully."
    else
      render :new
    end
  end

  private

  def farmer_params
    params.require(:farmer).permit(:name, :location, :contact_information)
  end
end
