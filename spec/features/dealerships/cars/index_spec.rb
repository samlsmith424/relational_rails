require 'rails_helper'

RSpec.describe 'car index page' do
  it 'displays all cars in the car index' do
    dealership = Dealership.create!(name: "Honda", city: "Los Angeles", employees: 77, offer_financing: true)

    car = dealership.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: true, dealership_id: 1)

    visit "/cars"

    expect(page).to have_content(car.name)
  end

  it "shows specific dealerships cars" do
    honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)

    civic = honda.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: true)
    accord = honda.cars.create!(name: "Accord", body_style: "Coupe", mpg: 42, electrical: true)

    visit "/dealerships/#{honda.id}/cars"

    expect(page).to have_content(civic.name)
    expect(page).to have_content(accord.name)
  end

  it "shows cars in alphabetical order" do
    honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)

    civic = honda.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: true)
    accord = honda.cars.create!(name: "Accord", body_style: "Coupe", mpg: 42, electrical: true)
    cbr600 = honda.cars.create!(name: "CBR600rr", body_style: "Motorcycle", mpg: 50, electrical: true)

    visit "/dealerships/#{honda.id}/cars"

    click_on("Sort Alphabetically")

    expect(current_path).to eq("/dealerships/#{honda.id}/cars")

    expect(accord.name).to appear_before(cbr600.name)
    expect(cbr600.name).to appear_before(civic.name)
  end

end
