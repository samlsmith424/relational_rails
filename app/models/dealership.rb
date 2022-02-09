class Dealership < ApplicationRecord
  has_many :cars, dependent: :destroy

  def self.order_first
    order(created_at: :desc)
  end

  def cars_count
    cars.count
  end

end
