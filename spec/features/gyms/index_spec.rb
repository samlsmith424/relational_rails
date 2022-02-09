require 'rails_helper'

RSpec.describe 'gym index page' do
  before(:each) do
    @gym_1 = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
    @gym_2 = Gym.create!(name: "Planet Pump", city: "Marin", capacity: 160, is_open: false)
    @gym_3 = Gym.create!(name: "Equinox", city: "San Francisco", capacity: 200, is_open: false)
  end

  it 'displays all gyms in the gym index' do
    visit "/gyms/"

    expect(page).to have_content(@gym_1.name)
    expect(page).to have_content(@gym_2.name)
    expect(page).to have_content(@gym_3.name)
  end

  it 'orders gym by those most recently created first' do
    visit "/gyms"

    expect(@gym_2.name).to appear_before(@gym_1.name)
    expect(@gym_3.name).to appear_before(@gym_2.name)
    expect(@gym_2.name).to_not appear_before(@gym_3.name)
    expect(@gym_1.name).to_not appear_before(@gym_2.name)
  end

  it 'displays an edit button for each gym' do
    visit "/gyms"

    expect(page).to have_content("Edit #{@gym_1.name}")
  end

  it 'can edit each gym' do
    visit "/gyms"

    click_on "Edit #{@gym_1.name}"

    expect(current_path).to eq("/gyms/#{@gym_1.id}/edit")
  end

  it 'has a link to delete a gym' do
    visit "/gyms"

    expect(page).to have_content("Delete #{@gym_1.name}")
  end

  it 'deletes a gym' do
    visit "/gyms"

    expect(page).to have_content(@gym_1.name)

    click_on "Delete #{@gym_1.name}"

    expect(current_path).to eq("/gyms")
    expect(page).to_not have_content(@gym_1.name)
  end

end
