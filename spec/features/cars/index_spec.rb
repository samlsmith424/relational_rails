require 'rails_helper'

RSpec.describe 'machine index page' do
  before(:each) do
    @dealership = Dealership.create!(name: "Honda", city: "Denver", employees: 69, offer_financing: false)
    @accord = @dealership.cars.create!(name: "Accord", body_style: "Coupe", mpg: 69, electrical: true)
    @civic = @dealership.cars.create!(name: "civic", body_style: "Coupe", mpg: 59, electrical: true)
    @crv = @dealership.cars.create!(name: "CRV", body_style: "Convertable", mpg: 89, electrical: false)
  end

  it 'Displays Cars with attributes' do

    visit "/cars"

    expect(page).to have_content(@accord.name)
    expect(page).to have_content(@civic.name)
    expect(page).to have_content(@accord.body_style)
    expect(page).to have_content(@civic.body_style)
    expect(page).to have_content(@accord.mpg)
    expect(page).to have_content(@civic.mpg)
    expect(page).to have_content(@accord.electrical)
    expect(page).to have_content(@civic.electrical)
  end

  it 'displays only electrical cars' do

    visit "/cars"

    expect(page).to have_content("Accord")
    expect(page).to have_content("civic")
    expect(page).to_not have_content("CRV")
  end

  it 'shows edit button for each car' do

    visit "/cars"

    expect(page).to have_content("Edit #{@accord.name}")
    expect(page).to have_content("Edit #{@civic.name}")
  end


  it 'routes us to edit page when I click edit button' do

    visit "/cars"

    click_on("Edit #{@accord.name}")

    expect(current_path).to eq("/cars/#{@accord.id}/edit")
  end

  it "Has a delete button" do

    visit "/cars"

    expect(page).to have_content("Delete #{@civic.name}")
  end

  it "Can delete a Car" do
    visit "/cars"

    expect(page).to have_content("Delete #{@civic.name}")

    expect(page).to have_content("civic")

    click_on("Delete #{@civic.name}")

    expect(current_path).to eq( "/cars")

    expect(page).to_not have_content("civic")
  end

  it 'displays a link to the Cars index on every page' do
    visit "/"
    expect(page).to have_link("Cars Index", :href =>"/cars")

    visit "/dealerships"
    expect(page).to have_link("Cars Index", :href =>"/cars")

    visit "/dealerships/#{@dealership.id}"
    expect(page).to have_link("Cars Index", :href =>"/cars")

    visit "/dealerships/#{@dealership.id}/cars"
    expect(page).to have_link("Cars Index", :href =>"/cars")

    visit "/cars"
    expect(page).to have_link("Cars Index", :href =>"/cars")

    visit "/cars/#{@accord.id}"
    expect(page).to have_link("Cars Index", :href =>"/cars")
  end

end
