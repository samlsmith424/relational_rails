class Gym < ApplicationRecord
  has_many :machines
  validates :capacity, presence: true  
end
