class CreateNeedings < ActiveRecord::Migration
  def change
    create_table :needings do |t|
      t.integer :food_id
      t.integer :condiment_id

      t.timestamps null: false
    end
  end
end
