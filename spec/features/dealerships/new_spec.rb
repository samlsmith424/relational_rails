RSpec.describe 'the gym creation' do
  before(:each) do
    @honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
  end

  it 'links to the new page from the dealership index' do
    visit "/dealerships"

    click_link('New Dealership')

    expect(current_path).to eq('/dealerships/new')
  end

  it 'can create a new dealership' do

    visit '/dealerships/new'

    fill_in('Name', with: 'Chevy')
    fill_in('City', with: 'Denver')
    fill_in('Employees', with: 100)
    check('Offer financing')
    click_button('Create Dealership')

    new_dealership_id = Dealership.last.id

    expect(current_path).to eq("/dealerships/#{new_dealership_id}")
    expect(page).to have_content("Chevy")
  end
end
