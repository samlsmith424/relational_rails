require 'rails_helper'

RSpec.describe 'machine index page' do
  before(:each) do
    @gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
    @machine = @gym.machines.create!(name: "Leg Press", section: "Resistance Machines", recommended_sets: 5, recommended_reps: 10, is_broken: true)
    @machine_2 = @gym.machines.create!(name: "Elliptical", section: "Cardio", recommended_sets: 1, recommended_reps: 1, is_broken: false)
    @machine_3 = @gym.machines.create!(name: "Stair Climber", section: "Cardio", recommended_sets: 3, recommended_reps: 2, is_broken: true)
  end

  it 'displays only broken machines and their attributes' do
    visit "/machines"

    expect(page).to have_content(@machine.name)
    expect(page).to have_content(@machine.section)
    expect(page).to have_content(@machine.recommended_sets)
    expect(page).to have_content(@machine.recommended_reps)
    expect(page).to have_content(@machine.is_broken)
    expect(page).to have_content(@machine_3.name)
    expect(page).to have_content(@machine_3.section)
    expect(page).to have_content(@machine_3.recommended_sets)
    expect(page).to have_content(@machine_3.recommended_reps)
    expect(page).to have_content(@machine_3.is_broken)
    expect(page).to_not have_content(@machine_2.name)
  end

  it 'displays an edit button for each machine' do
    visit "/machines"

    expect(page).to have_content("Edit #{@machine.name}")
  end

  it 'can edit each machine' do
    visit "/machines"

    click_on "Edit #{@machine.name}"

    expect(current_path).to eq("/machines/#{@machine.id}/edit")
  end

  it 'has a link to delete a machine' do
    visit "/machines"

    expect(page).to have_content("Delete #{@machine.name}")
  end

  it 'deletes a machine' do
    visit "/machines"

    expect(page).to have_content(@machine.name)

    click_on "Delete #{@machine.name}"

    expect(current_path).to eq("/machines")
    expect(page).to_not have_content(@machine.name)
  end

  it 'has links to machines index on top of the page' do
    visit "/machines"
    expect(page).to have_link("Machines Index", :href =>"/machines")

    visit "/machines/#{@machine.id}"
    expect(page).to have_link("Machines Index", :href =>"/machines")

    visit "/"
    expect(page).to have_link("Machines Index", :href =>"/machines")

    visit "/gyms"
    expect(page).to have_link("Machines Index", :href =>"/machines")

    visit "/gyms/#{@gym.id}"
    expect(page).to have_link("Machines Index", :href =>"/machines")

    visit "/gyms/#{@gym.id}/machines"
    expect(page).to have_link("Machines Index", :href =>"/machines")
  end
end
