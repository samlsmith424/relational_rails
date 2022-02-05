require 'rails_helper'

RSpec.describe Car do
  describe 'relationships' do
    it { should belong_to :dealership }
  end

end
