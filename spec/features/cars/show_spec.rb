require 'rails_helper'

RSpec.describe 'car show page' do
  it 'displays all cars in the car index' do
    dealership = Dealership.create!(name: "Honda", city: "Los Angeles", employees: 77, offer_financing: true)

    car = dealership.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: false, dealership_id: 1)

    visit "/cars/#{car.id}"

    expect(page).to have_content(car.name)
  end
end
