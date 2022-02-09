require 'rails_helper'

RSpec.describe 'the Car update' do
  it 'links to the edit page in car index' do
    honda = Dealership.create!(name: "Honda", city: 'Testfield', employees: 69, offer_financing: true)
    civic = honda.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: true)
    accord = honda.cars.create!(name: "Accord", body_style: "Coupe", mpg: 42, electrical: true)
    cbr600 = honda.cars.create!(name: "CBR600rr", body_style: "Motorcycle", mpg: 50, electrical: true)

    visit "/cars/#{civic.id}"

    click_link("Update Car")

    expect(current_path).to eq("/cars/#{civic.id}/edit")
  end

  it 'can update a car' do
    honda = Dealership.create!(name: "Honda", city: 'Testfield', employees: 69, offer_financing: true)
    civic = honda.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: true)
    accord = honda.cars.create!(name: "Accord", body_style: "Coupe", mpg: 42, electrical: true)
    cbr600 = honda.cars.create!(name: "CBR600rr", body_style: "Motorcycle", mpg: 50, electrical: true)

    visit "/cars/#{civic.id}/edit"

    fill_in('Name', with: 'Chevy')
    fill_in('Body style', with: 'Arvada')
    fill_in('Mpg', with: 99)

    check("Electrical")

    click_button('Update Car')

    expect(current_path).to eq("/cars/#{civic.id}")
    expect(page).to have_content("Chevy")
  end
end
