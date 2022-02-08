require 'rails_helper'

RSpec.describe 'the Dealership Creation' do
  it 'links to the new page from the delaership index' do

    visit '/dealerships'

    click_link('New Dealership')

    expect(current_path).to eq('/dealerships/new')
  end

  it 'can create a new dealership' do
    visit '/dealerships/new'

    fill_in('Name', with: 'Chevy')
    fill_in('City', with: 'Arvada')
    fill_in('Employees', with: 99)
    # click_button('Offer Financing')
    click_button('Create Dealership')
    
    new_dealership_id = Dealership.last.id

    expect(current_path).to eq("/dealerships/#{new_dealership_id}")
    expect(page).to have_content('Chevy')
  end

end
