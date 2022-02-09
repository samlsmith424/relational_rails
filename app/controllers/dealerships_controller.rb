class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all.order(created_at: :desc)
  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  def new
  end

  def create
    new = Dealership.create!(dealerships_params)
    redirect_to "/dealerships/#{new.id}"
  end

  def edit
    @updated_dealership = Dealership.find(params[:id])
  end

  def update
    dealership = Dealership.find(params[:id])
    dealership.update(dealerships_params)
    redirect_to '/dealerships'
  end

  def destroy
      dealership = Dealership.find(params[:id])
      dealership.destroy
      redirect_to '/dealerships'
    end


  private

  def dealerships_params
    params.permit(:name, :city, :employees, :offer_financing)
  end


end
