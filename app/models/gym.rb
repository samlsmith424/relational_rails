class Gym < ApplicationRecord
  has_many :machines
  validates :capacity, presence: true

  def self.create_first
    Gym.order(created_at: :desc)
  end

  def machine_count
    machines.count 
  end

end
