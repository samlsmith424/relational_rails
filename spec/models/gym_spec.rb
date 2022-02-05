require 'rails_helper'

RSpec.describe Gym, type: :model do
  describe 'relationships' do
    it { should have_many :machines }
  end

  describe  'validations' do
    it { should validate_presence_of :capacity }
    it { should validate_inclusion_of(:is_open).in_array([true, false])}
  end
end
