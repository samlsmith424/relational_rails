require 'rails_helper'

RSpec.describe 'machine update page' do
  before(:each) do
    @gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
    @machine = @gym.machines.create!(name: "Leg Press", section: "Resistance Machines", recommended_sets: 5, recommended_reps: 10, is_broken: false, gym_id: 1)
    @machine_2 = @gym.machines.create!(name: "Elliptical", section: "Cardio", recommended_sets: 1, recommended_reps: 1, is_broken: false)
  end

  it 'has a link to update a machine' do
    visit "/machines/#{@machine.id}"

    click_link "Update #{@machine.name}"

    expect(current_path).to eq("/machines/:id/edit")
  end

end
