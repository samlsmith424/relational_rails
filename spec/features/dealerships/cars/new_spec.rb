require 'rails_helper'

RSpec.describe 'add a car' do
  it 'displays a link to create a new car' do
    dealership = Dealership.create!(name: "Test", city: 'Testfield', employees: 69, offer_financing: false)

    visit "/dealerships/#{dealership.id}/cars"

    click_link("Create Car")

    expect(current_path).to eq("/dealerships/#{dealership.id}/cars/new")
  end

  it 'can add a car to a dealership' do
    dealership = Dealership.create!(name: "Test", city: 'Testfield', employees: 69, offer_financing: false)

    visit "/dealerships/#{dealership.id}/cars/new"

    fill_in('Name', with: 'Accord')
    fill_in('Body style', with: 'Coupe')
    fill_in('Mpg', with: 69)

    click_button('Create Car')

    expect(current_path).to eq("/dealerships/#{dealership.id}/cars")

    expect(page).to have_content("Accord")
  end
end
