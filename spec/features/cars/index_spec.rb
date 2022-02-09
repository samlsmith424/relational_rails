require 'rails_helper'

RSpec.describe 'machine index page' do
  before(:each) do
    @dealership = Dealership.create!(name: "Honda", city: "Denver", employees: 69, offer_financing: false)
    @accord = @dealership.cars.create!(name: "Accord", body_style: "Coupe", mpg: 69, electrical: true)
    @civic = @dealership.cars.create!(name: "civic", body_style: "Coupe", mpg: 59, electrical: true)
    @crv = @dealership.cars.create!(name: "CRV", body_style: "Convertable", mpg: 89, electrical: false)
  end

  it 'displays only electrical cars' do
    
    visit "/cars"

    expect(page).to have_content("Accord")
    expect(page).to have_content("civic")
    expect(page).to_not have_content("CRV")
  end

end
