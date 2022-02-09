class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def new
  end

  def create
    gym = Gym.create(gym_params)
    redirect_to "/gyms/#{gym.id}"
  end

  def edit
    @gym = Gym.find(params[:gym_id])
  end

  def update
    gym = Gym.find(params[:gym_id])
    gym.update(gym_params)
    redirect_to "/gyms/#{gym.id}"
  end

  def destroy
    gym = Gym.find(params[:id])
    gym.destroy
    redirect_to '/gyms'
  end

  private

  def gym_params
    params.permit(:name, :city, :capacity, :is_open)
  end
end
