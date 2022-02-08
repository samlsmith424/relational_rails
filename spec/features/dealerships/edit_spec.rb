require 'rails_helper'

RSpec.describe 'the Dealership update' do
  it 'links to the edit page in dealership index' do
    test = Dealership.create!(name: "Test", city: 'Testfield', employees: 69, offer_financing: false)

    visit "/dealerships/#{test.id}"

    click_link('Update Dealership')

    expect(current_path).to eq("/dealerships/#{test.id}/edit")
  end

  it 'can update a dealership' do
    test = Dealership.create!(name: "Test", city: 'Testfield', employees: 69, offer_financing: false)

    visit "/dealerships/#{test.id}/edit"

    fill_in('Name', with: 'Chevy')
    fill_in('City', with: 'Arvada')
    fill_in('Employees', with: 99)

    check("Offer financing")

    click_button('Update Dealership')

    expect(current_path).to eq("/dealerships")

    expect(page).to have_content("Chevy")
  end
end
