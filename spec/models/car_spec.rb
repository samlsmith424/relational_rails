require 'rails_helper'

RSpec.describe Car do
  describe 'relationships' do
    it { should belong_to :dealership }
  end

  describe 'class methods' do
    it 'displays only electrical vehicles' do
      dealership = Dealership.create!(name: "Honda", city: "Denver", employees: 69, offer_financing: false)
      accord = dealership.cars.create!(name: "Accord", body_style: "Coupe", mpg: 69, electrical: true)
      civic = dealership.cars.create!(name: "civic", body_style: "Coupe", mpg: 59, electrical: true)
      crv = dealership.cars.create!(name: "CRV", body_style: "Convertable", mpg: 89, electrical: false)

      expect(dealership.cars.all_electrical).to eq([accord, civic])
      expect(dealership.cars.all_electrical).to_not eq([crv])
    end

    it "Filters amount by input threshold" do
      dealership = Dealership.create!(name: "Honda", city: "Denver", employees: 69, offer_financing: false)
      accord = dealership.cars.create!(name: "Accord", body_style: "Coupe", mpg: 69, electrical: true)
      civic = dealership.cars.create!(name: "civic", body_style: "Coupe", mpg: 59, electrical: true)
      crv = dealership.cars.create!(name: "CRV", body_style: "Convertable", mpg: 89, electrical: false)

      expect(dealership.cars.mpg_threshold(68)).to eq([accord, crv])
      expect(dealership.cars.mpg_threshold(68)).to_not eq([civic])
    end
  end
end
