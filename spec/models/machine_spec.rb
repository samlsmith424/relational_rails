require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'relationships' do
    it { should belong_to :gym }
  end

  describe 'class methods' do
    it 'only displays records where is_broken is true' do
      gym_1 = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
      machine_1 = gym_1.machines.create!(name: "Leg Press", section: "Resistance Machines", recommended_sets: 5, recommended_reps: 10, is_broken: false)
      machine_2 = gym_1.machines.create!(name: "Elliptical", section: "Cardio", recommended_sets: 1, recommended_reps: 1, is_broken: true)
      machine_3 = gym_1.machines.create!(name: "Smith Machine", section: "Personal Training", recommended_sets: 5, recommended_reps: 12, is_broken: true)
    
      expect(gym_1.machines.show_broken).to eq([machine_2, machine_3])
      expect(gym_1.machines.show_broken).to_not eq([machine_1])
    end
  end
end
