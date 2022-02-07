require 'rails_helper'

RSpec.describe 'Machines at each gym' do
  before(:each) do
    @gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
    @machine = @gym.machines.create!(name: "Leg Press", section: "Resistance Machines", recommended_sets: 5, recommended_reps: 10, is_broken: false)
    @machine_2 = @gym.machines.create!(name: "Elliptical", section: "Cardio", recommended_sets: 1, recommended_reps: 1, is_broken: false)
  end

  it 'displays a link to add a new machine' do
    visit "/gyms/#{@gym.id}/machines"

    click_link "Create Machine"

    expect(current_path).to eq("/gyms/#{@gym.id}/machines/new")
  end

  it 'displays a form to add a a new machine' do
    visit "/gyms/#{@gym.id}/machines/new"

    fill_in('Name', with: "Cable Lat Pulldown")
    fill_in('Section', with: "Resistance Machines")
    fill_in('Recommended sets', with: 5)
    fill_in('Recommended reps', with: 12)
    check('Is broken')
    click_button('Create Machine')

    expect(current_path).to eq("/gyms/#{@gym.id}/machines")
    expect(page).to have_content("Cable Lat Pulldown")
  end
end
