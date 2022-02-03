class AddCapacityToGyms < ActiveRecord::Migration[5.2]
  def change
    add_column :gyms, :capacity, :integer
  end
end
