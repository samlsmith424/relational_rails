class DealershipCarsController < ApplicationController
  def index
    @dealership = Dealership.find(params[:dealership_id])

    @cars = @dealership.cars
  end

  def new
    @dealership = Dealership.find(params[:id])
  end

  def create
    dealership = Dealership.find(params[:id])
    cars = dealership.cars.create(car_params)
    redirect_to "/dealerships/#{dealership.id}/cars"
  end

  def edit
  end

  private

  def car_params
    params.permit(:name, :body_style, :mpg, :electrical)
  end


end
