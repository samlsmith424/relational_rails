require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'relationships' do
    it { should belong_to :gym }
  end

end
