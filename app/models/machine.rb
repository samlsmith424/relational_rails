class Machine < ApplicationRecord
  belongs_to :gym

  def self.show_broken
    where(is_broken: true)
  end
end
