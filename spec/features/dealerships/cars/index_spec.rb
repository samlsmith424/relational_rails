require 'rails_helper'

RSpec.describe 'car index page' do
  it 'displays all cars in the car index' do
    dealership = Dealership.create!(name: "Honda", city: "Los Angeles", employees: 77, offer_financing: true)

    car = dealership.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: false, dealership_id: 1)

    visit "/cars"

    expect(page).to have_content(car.name)
  end

  it "shows specific dealerships cars" do
    honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
    nissan = Dealership.create!(name: 'Nissan', city: 'Riverside', employees: 77, offer_financing: false)
    toyota = Dealership.create!(name: 'Toyota', city: 'Denver', employees: 38, offer_financing: false)

    civic = honda.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: true)
    accord = honda.cars.create!(name: "Accord", body_style: "Coupe", mpg: 42, electrical: false)

    gtr = nissan.cars.create!(name: "GTR", body_style: "Coupe", mpg: 26, electrical: false)
    altima = nissan.cars.create!(name: "Altima", body_style: "Sedan", mpg: 30, electrical: false)

    supra = toyota.cars.create!(name: "Supra", body_style: "Coupe", mpg: 28, electrical: false)
    tundra = toyota.cars.create!(name: "Tundra", body_style: "Truck", mpg: 19, electrical: false)

    visit "/dealerships/#{honda.id}/cars"

    expect(page).to have_content(civic.name)
    expect(page).to have_content(accord.name)
  end
end
