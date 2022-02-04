require 'rails_helper'

RSpec.describe 'machine show page' do
  it 'displays all machines in the machine index' do
    gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)

    machine = gym.machines.create!(name: "Leg Press", section: "Resistance Machines", recommended_sets: 5, recommended_reps: 10, is_broken: false, gym_id: 1)
    # machine_2 = Machine.create!(name: "Elliptical", section: "Cardio", recommended_sets: 1, recommended_reps: 1, is_broken: false)

    visit "/machines"

    expect(page).to have_content(machine.name)
  end
end
