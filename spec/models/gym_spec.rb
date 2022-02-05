require 'rails_helper'

RSpec.describe Gym, type: :model do
  describe 'relationships' do
    it { should have_many :machines }
  end

  describe  'validations' do
    it { should validate_presence_of :capacity }
    it { should validate_inclusion_of(:is_open).in_array([true, false])}
  end

  describe 'class methods' do
    it 'orders gym by those most recently created first' do
      gym_2 = Gym.create!(name: "Planet Pump", city: "Marin", capacity: 160, is_open: false)
      gym_1 = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
      gym_3 = Gym.create!(name: "Equinox", city: "San Francisco", capacity: 200, is_open: false)

      expect(Gym.create_first.first).to eq(gym_3)
    end
  end

  describe 'instance methods' do
    it 'can count machines associated with each gym' do
      gym_1 = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
      machine = gym_1.machines.create!(name: "Leg Press", section: "Resistance Machines", recommended_sets: 5, recommended_reps: 10, is_broken: false)
      machine_2 = gym_1.machines.create!(name: "Elliptical", section: "Cardio", recommended_sets: 1, recommended_reps: 1, is_broken: false)
      machine_3 = gym_1.machines.create!(name: "Smith Machine", section: "Personal Training", recommended_sets: 5, recommended_reps: 12, is_broken: true)

      expect(gym_1.machine_count).to eq(3)
    end
  end

end
