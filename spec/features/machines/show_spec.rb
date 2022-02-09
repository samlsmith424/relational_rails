require 'rails_helper'

RSpec.describe 'machine show page' do
  before(:each) do
    @gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
    @machine = @gym.machines.create!(name: "Leg Press", section: "Resistance Machines", recommended_sets: 5, recommended_reps: 10, is_broken: true, gym_id: 1)
    @machine_2 = @gym.machines.create!(name: "Elliptical", section: "Cardio", recommended_sets: 1, recommended_reps: 1, is_broken: true)
  end

  it 'displays the machine and its attributes' do
    visit "/machines/#{@machine.id}"

    expect(page).to have_content(@machine.name)
    expect(page).to have_content(@machine.section)
    expect(page).to have_content(@machine.recommended_sets)
    expect(page).to have_content(@machine.recommended_reps)
    expect(page).to have_content(@machine.is_broken)
    expect(page).to_not have_content(@machine_2.name)
  end

  it 'can see a count of machines associated with each gym' do
    visit "/gyms/#{@gym.id}"

    expect(page).to have_content("Machine Count: #{@gym.machine_count}")
  end

  it 'has a link to delete a machine' do
    visit "/machines/#{@machine.id}"

    expect(page).to have_content("Delete #{@machine.name}")
  end

  it 'deletes a machine' do
    visit "/machines/#{@machine.id}"
    expect(page).to have_content(@machine.name)

    click_on "Delete #{@machine.name}"

    expect(current_path).to eq("/machines")
    expect(page).to_not have_content(@machine.name)
  end
end
