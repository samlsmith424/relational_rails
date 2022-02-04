require 'rails_helper'

RSpec.describe 'gym show page' do
  it 'displays all gyms in the gym index' do
    gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
    gym_2 = Gym.create!(name: "Planet Pump", city: "Marin", capacity: 160, is_open: false)
    gym_3 = Gym.create!(name: "Equinox", city: "San Francisco", capacity: 200, is_open: false)
    visit "/gyms/"

    expect(page).to have_content(gym.name)
    expect(page).to have_content(gym_2.name)
    expect(page).to have_content(gym_3.name)
  end

  it 'displays one gym page per gym id' do
    gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
    gym_2 = Gym.create!(name: "Planet Pump", city: "Marin", capacity: 160, is_open: false)

    visit "/gyms/#{gym.id}"

    expect(page).to have_content(gym.name)
    expect(page).to_not have_content(gym_2.name)
  end

  it 'gym page displays its individual attributes' do
    gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
    gym_2 = Gym.create!(name: "Planet Pump", city: "Marin", capacity: 160, is_open: false)

    visit "/gyms/#{gym.id}"

    expect(page).to have_content(gym.city)
    expect(page).to_not have_content(gym_2.city)
    expect(page).to have_content(gym.capacity)
    expect(page).to_not have_content(gym_2.capacity)
    expect(page).to have_content(gym.is_open)
    expect(page).to_not have_content(gym_2.is_open)
  end
end