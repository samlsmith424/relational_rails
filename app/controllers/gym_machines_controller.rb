class GymMachinesController < ApplicationController
  def index
    @gym= Gym.find(params[:gym_id])
    @machines = @gym.machines
    if params[:sort_by] == "name"
      @machines = @machines.order(:name)
    elsif params[:rep_threshold]
      @machines = @machines.rep_threshold(params[:rep_threshold])  
    end
  end

  def new
    @gym= Gym.find(params[:gym_id])
  end

  def create
    gym= Gym.find(params[:gym_id])
    machine = gym.machines.create!(machine_params)
    redirect_to "/gyms/#{gym.id}/machines"
  end

  private

  def machine_params
    params.permit(:name, :section, :recommended_sets, :recommended_reps, :is_broken)
  end
end
