require 'rails_helper'

RSpec.describe 'car show page' do
  it 'displays all cars in the car index' do
    dealership = Dealership.create!(name: "Honda", city: "Los Angeles", employees: 77, offer_financing: true)

    car = dealership.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: false, dealership_id: 1)

    visit "/cars/#{car.id}"

    expect(page).to have_content(car.name)
  end

  it 'displays all cars in the cars index' do
    dealership = Dealership.create!(name: "Honda", city: "Los Angeles", employees: 77, offer_financing: true)

    car = dealership.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: true, dealership_id: 1)

    visit "/cars"

    expect(page).to have_content(car.name)
  end

  it 'can see a count of cars associated with each dealership' do
    dealership = Dealership.create!(name: "Honda", city: "Los Angeles", employees: 77, offer_financing: true)

    car = dealership.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: true, dealership_id: 1)

    visit "/dealerships/#{dealership.id}"

    expect(page).to have_content("Number of Cars: #{dealership.cars.count}")
  end

  it "Has a delete button" do
    honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
    civic = honda.cars.create!(name: 'Civic', body_style: 'Riverside', mpg: 77, electrical: true)
    accord = honda.cars.create!(name: 'accord', body_style: 'Denver', mpg: 38, electrical: true)

    visit "/cars/#{civic.id}"

    expect(page).to have_content("Delete #{civic.name}")
  end

  it "Can delete a car" do
    honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
    civic = honda.cars.create!(name: 'Civic', body_style: 'Riverside', mpg: 77, electrical: true)
    accord = honda.cars.create!(name: 'accord', body_style: 'Denver', mpg: 38, electrical: true)

    visit "/cars/#{civic.id}"

    expect(page).to have_content("Delete #{civic.name}")

    expect(page).to have_content("Civic")

    click_on("Delete #{civic.name}")

    expect(page).to_not have_content("Civic")

    expect(current_path).to eq( "/cars")
  end
end
