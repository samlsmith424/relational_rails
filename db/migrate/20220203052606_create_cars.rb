class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :body_style
      t.integer :mpg
      t.boolean :electrical

      t.timestamps
    end
  end
end
