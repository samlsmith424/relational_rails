require 'rails_helper'

RSpec.describe 'the gym creation' do
  it 'links to the new page from the gym index' do
    visit '/gyms'

    click_link('New Gym')
    expect(current_path).to eq('/gyms/new')
  end

  it 'can create a new gym' do
    visit '/gyms/new'

    fill_in('Name', with: 'Fit')
    fill_in('City', with: 'Denver')
    fill_in('Capacity', with: 100)
    check('Is open')
    click_button('Create Gym')
    save_and_open_page
    expect(current_path).to eq('/gyms')
    expect(page).to have_content("Fit")
  end
end
