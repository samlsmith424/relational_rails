require 'rails_helper'

RSpec.describe 'gym show page' do
  it 'displays the gym page' do
    gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222)
    gym_2 = Gym.create!(name: "Planet Pump", city: "Marin", capacity: 160)

    visit "/gyms/#{gym.id}"

    expect(page).to have_content(gym.name)
    expect(page).to_not have_content(gym_2.name)
  end

  it 'should never have a null capacity' do
    
  end
end
