class Gym < ApplicationRecord
  has_many :machines, dependent: :destroy
  validates_presence_of :capacity, :name, :city
  # validates_inclusion_of(:is_open).in_array([true, false])
  validates :capacity, presence: true

  def self.create_first
    order(created_at: :desc)
  end

  def machine_count
    machines.count
  end
end
