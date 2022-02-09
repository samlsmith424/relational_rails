class Machine < ApplicationRecord
  belongs_to :gym

  def self.show_broken
    where(is_broken: true)
  end

  def self.rep_threshold(num)
    where("recommended_reps > #{num}")
  end
end
