class AddGymToMachine < ActiveRecord::Migration[5.2]
  def change
    add_reference :machines, :gym, foreign_key: true
  end
end
