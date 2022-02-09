class MachinesController < ApplicationController
  def index
    @machines = Machine.all
    # @index = Machine.all
    # @machines = @index.where(is_broken: true)
    # return @machines
  end

  def show
    @machine = Machine.find(params[:id])
  end

  def edit
    @machine = Machine.find(params[:id])
  end

  def update
    machine = Machine.find(params[:id])
    machine.update(machine_params)
    redirect_to "/machines/#{machine.id}"
  end

  def destroy
    machine = Machine.find(params[:id])
    machine.destroy
    redirect_to '/machines'
  end

  private
  def machine_params
    params.permit(:name, :capacity, :recommended_sets, :recommended_reps, :is_broken)
  end
end
