require 'rails_helper'

RSpec.describe 'dealership show page' do
  it 'displays all dealerships in the dealership index' do
    honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
    nissan = Dealership.create!(name: 'Nissan', city: 'Riverside', employees: 77, offer_financing: false)
    toyota = Dealership.create!(name: 'Toyota', city: 'Denver', employees: 38, offer_financing: false)
    visit "/dealerships"

    expect(page).to have_content(honda.name)
    expect(page).to have_content(nissan.name)
    expect(page).to have_content(toyota.name)
  end

  it 'displays one dealership page per dealerhship id' do
    honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
    nissan = Dealership.create!(name: 'Nissan', city: 'Riverside', employees: 77, offer_financing: false)

    visit "/dealerships/#{honda.id}"

    expect(page).to have_content(honda.name)
    expect(page).to_not have_content(nissan.name)
  end

  it 'dealership page displays its individual attributes' do
    honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
    nissan = Dealership.create!(name: 'Nissan', city: 'Riverside', employees: 77, offer_financing: false)

    visit "/dealerships/#{honda.id}"

    expect(page).to have_content(honda.city)
    expect(page).to_not have_content(nissan.city)
    expect(page).to have_content(honda.employees)
    expect(page).to_not have_content(nissan.employees)
    expect(page).to have_content(honda.offer_financing)
    expect(page).to_not have_content(nissan.offer_financing)
  end

  it "Has a delete button" do
    honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
    nissan = Dealership.create!(name: 'Nissan', city: 'Riverside', employees: 77, offer_financing: false)
    toyota = Dealership.create!(name: 'Toyota', city: 'Denver', employees: 38, offer_financing: false)

    visit "/dealerships/#{honda.id}"

    expect(page).to have_content("Delete #{honda.name}")
  end

  it "Can delete a Dealership" do
    honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
    nissan = Dealership.create!(name: 'Nissan', city: 'Riverside', employees: 77, offer_financing: false)
    toyota = Dealership.create!(name: 'Toyota', city: 'Denver', employees: 38, offer_financing: false)

    visit "/dealerships/#{honda.id}"

    expect(page).to have_content("Delete #{honda.name}")
    expect(page).to have_content("Honda")

    click_on("Delete #{honda.name}")

    expect(page).to_not have_content("Honda")
    expect(current_path).to eq("/dealerships")
  end

  it 'displays a link to the Cars index Dealership show page' do
    honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)

    visit "/dealerships/#{honda.id}"
    expect(page).to have_link("Cars in Dealership", :href =>"/dealerships/#{honda.id}/cars")

  end
end
