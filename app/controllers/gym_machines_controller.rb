class GymMachinesController < ApplicationController
  def index
    gym= Gym.find(params[:gym_id])
    @machines = gym.machines 
  end
end
