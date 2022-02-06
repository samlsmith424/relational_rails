require 'rails_helper'

RSpec.describe 'the gym update' do
  it 'links to the update page' do
    gym_1 = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)

    visit '/gyms'

    click_link "Update #{gym_1.name}"

    expect(current_path).to eq("/gyms/#{gym_1.id}/edit")
  end

  it 'can edit the gym info' do
    gym_1 = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)

    visit "/gyms/#{gym_1.id}/edit"

    fill_in 'Name', with: 'All the Time Fitness'
    fill_in 'City', with: 'San Diego'
    fill_in 'Capacity', with: 700
    check('Is open')
    click_button "Submit"

    expect(current_path).to eq("/gyms")
    expect(page).to have_content('All the Time Fitness')
  end

end
