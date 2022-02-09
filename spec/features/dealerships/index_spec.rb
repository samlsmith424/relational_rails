require 'rails_helper'

RSpec.describe 'Dealerhship index page' do
  before(:each) do
    @honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
    @chevy = Dealership.create!(name: 'Chevy', city: 'Thornton', employees: 46, offer_financing: true)
    @nissan = Dealership.create!(name: 'nissan', city: 'Thornton', employees: 46, offer_financing: true)
  end

  it 'displays all dealerships in the dealership index' do
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



end
