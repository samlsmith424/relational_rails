require 'rails_helper'

RSpec.describe 'Car Update' do
  it 'directed to car edit page' do
    dealership = Dealership.create!(name: "Chevy", city: "Littleton", employees: 69, offer_financing: false)
    car = dealership.cars.create!(name: "Mustang", body_style: "Convertable", mpg: 20, electrical: false)

    visit "/cars/#{car.id}"

    click_link('Update Car')

    expect(current_path).to eq("/cars/#{car.id}/edit")
  end

  it 'can update a car' do
    chevy = Dealership.create!(name: "Chevy", city: "Littleton", employees: 69, offer_financing: false)
    mustang = chevy.cars.create!(name: "Musty", body_style: "Convertable", mpg: 20, electrical: false)

    visit "/cars/#{mustang.id}/edit"

    fill_in('Name', with: 'Mustang')
    fill_in('Body style', with: 'Convertable')
    fill_in('Mpg', with: 69)

    click_button('Update Car')

    expect(current_path).to eq("/cars/#{mustang.id}")

    expect(page).to have_content("Mustang")
  end
end
