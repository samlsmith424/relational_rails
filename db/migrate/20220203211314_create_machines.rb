class CreateMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.string :name
      t.string :section
      t.integer :recommended_sets
      t.integer :recommended_reps
      t.boolean :is_broken

      t.timestamps
    end
  end
end
