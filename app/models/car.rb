class Car < ApplicationRecord
  belongs_to :dealership

  def self.all_electrical
    where(electrical: true)
  end

end
