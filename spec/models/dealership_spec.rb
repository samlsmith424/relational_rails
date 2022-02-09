require 'rails_helper'

RSpec.describe Dealership do
  describe 'relationships' do
    it { should have_many :cars }
  end

  describe  'class methods' do
    before(:each) do
      @honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
      @chevy = Dealership.create!(name: 'Chevy', city: 'Thornton', employees: 46, offer_financing: true)
      @nissan = Dealership.create!(name: 'nissan', city: 'Thornton', employees: 46, offer_financing: true)
      @civic = @honda.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: true)
      @accord = @honda.cars.create!(name: "Accord", body_style: "Coupe", mpg: 42, electrical: true)
      @cbr600 = @honda.cars.create!(name: "CBR600rr", body_style: "Motorcycle", mpg: 50, electrical: true)
    end

    it 'orders dealerships by most recently created' do
      expect(Dealership.order_first.first).to eq(@nissan)
    end

    it 'shows car count on dealership show page' do
      expect(@honda.cars_count).to eq(3)
    end
  end
end
