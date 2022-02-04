class CreateDealerships < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.string :city
      t.integer :employees
      t.boolean :offer_financing

      t.timestamps
    end
  end
end
