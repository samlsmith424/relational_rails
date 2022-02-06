require 'rails_helper'

RSpec.describe 'the Dealership Creation' do
  it 'links to the new page from the delaership index' do

    visit '/dealerships'

    click_link('New Dealership')

    expect(current_path).to eq('/dealerships/new')
  end

end
