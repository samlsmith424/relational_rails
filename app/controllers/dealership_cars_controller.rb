class DealershipCarsController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    #binding.pry
    @cars = @dealership.cars
      if params[:sort_by] == 'alphabetically'
        @cars = @cars.order(:name)
      elsif params[:mpg_threshold]
        @cars = @cars.mpg_threshold(params[:mpg_threshold])
      end
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
    # @dealership = Dealership.find(params[:id])
  end

  private

  def car_params
    params.permit(:name, :body_style, :mpg, :electrical)
  end


end
