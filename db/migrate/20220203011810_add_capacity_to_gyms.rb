class AddCapacityToGyms < ActiveRecord::Migration[5.2]
  def change
    add_column :gyms, :capacity, :integer
    add_column :gyms, :is_open, :boolean
  end
end
