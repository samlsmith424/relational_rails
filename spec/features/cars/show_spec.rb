require 'rails_helper'

RSpec.describe 'car show page' do
  before(:each) do
    @dealership = Dealership.create!(name: "Honda", city: "Denver", employees: 69, offer_financing: false)
    @accord = @dealership.cars.create!(name: "Accord", body_style: "Coupe", mpg: 69, electrical: true)
    @civic = @dealership.cars.create!(name: "civic", body_style: "Coupe", mpg: 59, electrical: true)
    @crv = @dealership.cars.create!(name: "CRV", body_style: "Convertable", mpg: 89, electrical: false)
  end

  it 'displays all cars and attributes in the car show page' do

    visit "/cars/#{@accord.id}"

    expect(page).to have_content(@accord.name)
    expect(page).to have_content(@accord.body_style)
    expect(page).to have_content(@accord.mpg)
    expect(page).to have_content(@accord.electrical)
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
