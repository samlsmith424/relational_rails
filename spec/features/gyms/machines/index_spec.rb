require 'rails_helper'

RSpec.describe 'Machines at each gym' do
  before(:each) do
    @gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
    @machine = @gym.machines.create!(name: "Leg Press", section: "Resistance Machines", recommended_sets: 5, recommended_reps: 10, is_broken: false)
    @machine_2 = @gym.machines.create!(name: "Elliptical", section: "Cardio", recommended_sets: 1, recommended_reps: 1, is_broken: false)
  end
  it 'shows each machine that is associated with a specific gym' do
    visit "/gyms/#{@gym.id}/machines"

    expect(page).to have_content(@machine.name)
    expect(page).to have_content(@machine_2.name)
  end

  it 'shows each machines attributes' do
    visit "/gyms/#{@gym.id}/machines"

    click_on @machine.name

    expect(current_path).to eq("/machines/#{@machine.id}")
  end

  it 'displays a link to sort the machines alphabetically' do
    visit "/gyms/#{@gym.id}/machines"

    click_on 'Sort Alphabetically'

    expect(current_path).to eq("/gyms/#{@gym.id}/machines")
    expect(@machine_2.name).to appear_before(@machine.name)
  end

  it 'displays an edit button for each gym machine' do
    visit "/gyms/#{@gym.id}/machines"

    expect(page).to have_content("Edit #{@machine.name}")
  end

  it 'can edit each gym machine' do
    visit "/gyms/#{@gym.id}/machines"

    click_on "Edit #{@machine.name}"

    expect(current_path).to eq("/machines/#{@machine.id}/edit")
  end

  it 'has a form that returns records according to input threshold' do
    visit "/gyms/#{@gym.id}/machines"

    expect(page).to have_content("Leg Press")
    expect(page).to have_content("Elliptical")

    fill_in('Rep threshold', with: 4)
    click_on('Filter Machines by Rep Threshold')
    
    expect(current_path).to eq("/gyms/#{@gym.id}/machines")
    expect(page).to have_content("Leg Press")
    expect(page).to_not have_content("Elliptical")
  end
end
