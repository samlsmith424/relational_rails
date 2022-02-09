class Car < ApplicationRecord
  belongs_to :dealership

  def self.all_electrical
    where(electrical: true)
  end

  def self.mpg_threshold(num)
    where("mpg > #{num}")
  end
end
