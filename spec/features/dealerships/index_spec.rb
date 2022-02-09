require 'rails_helper'

RSpec.describe 'Dealerhship index page' do
  before(:each) do
    @honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
    @chevy = Dealership.create!(name: 'Chevy', city: 'Thornton', employees: 46, offer_financing: true)
    @nissan = Dealership.create!(name: 'nissan', city: 'Thornton', employees: 46, offer_financing: true)
    @accord = @honda.cars.create!(name: "Accord", body_style: "Coupe", mpg: 69, electrical: true)
  end

  it 'displays all dealerships names in the dealership index' do
    visit "/dealerships"

    expect(page).to have_content(@honda.name)
    expect(page).to have_content(@nissan.name)
    expect(page).to have_content(@chevy.name)
  end

  it 'orders gym by those most recently created first' do
    visit "/dealerships"

    expect(@nissan.name).to appear_before(@chevy.name)
    expect(@chevy.name).to appear_before(@honda.name)
    expect(@honda.name).to_not appear_before(@chevy.name)
    expect(@chevy.name).to_not appear_before(@nissan.name)
  end

  it 'shows edit button' do

    visit "/dealerships"

    expect(page).to have_content("Edit #{@nissan.name}")
    expect(page).to have_content("Edit #{@chevy.name}")
    expect(page).to have_content("Edit #{@honda.name}")
  end


  it 'routes us to edit page when I click edit button' do

    visit "/dealerships"

    click_on("Edit #{@nissan.name}")

    expect(current_path).to eq("/dealerships/#{@nissan.id}/edit")
  end

  it "Has a delete button" do
    honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
    nissan = Dealership.create!(name: 'Nissan', city: 'Riverside', employees: 77, offer_financing: false)
    toyota = Dealership.create!(name: 'Toyota', city: 'Denver', employees: 38, offer_financing: false)

    visit "/dealerships"

    expect(page).to have_content("Delete #{honda.name}")
  end

  it "Can delete a Dealership" do
    visit "/dealerships"

    expect(page).to have_content("Delete #{@honda.name}")
    expect(page).to have_content("Honda")

    click_on("Delete #{@honda.name}")

    expect(current_path).to eq( "/dealerships")
    expect(page).to_not have_content("Honda")
  end

  it 'displays a link to the Dealerhships index on every page' do
    visit "/"
    expect(page).to have_link("Dealerships Index", :href =>"/dealerships")

    visit "/dealerships"
    expect(page).to have_link("Dealerships Index", :href =>"/dealerships")

    visit "/dealerships/#{@honda.id}"
    expect(page).to have_link("Dealerships Index", :href =>"/dealerships")

    visit "/dealerships/#{@honda.id}/cars"
    expect(page).to have_link("Dealerships Index", :href =>"/dealerships")

    visit "/cars"
    expect(page).to have_link("Dealerships Index", :href =>"/dealerships")

    visit "/cars/#{@accord.id}"
    expect(page).to have_link("Dealerships Index", :href =>"/dealerships")
  end
end
