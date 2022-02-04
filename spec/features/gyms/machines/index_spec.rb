require 'rails_helper'

RSpec.describe 'Machines at each gym' do
  it 'shows each machine that is associated with a specific gym' do
    gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
    machine = Machine.create!(name: "Leg Press", section: "Resistance Machines", recommended_sets: 5, recommended_reps: 10, is_broken: false, gym_id: 1)
    machine_2 = Machine.create!(name: "Elliptical", section: "Cardio", recommended_sets: 1, recommended_reps: 1, is_broken: false, gym_id: 1)

    visit "/gyms/#{gym.id}/machines"

    expect(page).to have_content(machine.name)
    expect(page).to have_content(machine_2.name)
  end
end
