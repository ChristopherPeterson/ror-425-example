class CreateCondiments < ActiveRecord::Migration
  def change
    create_table :condiments, id: false do |t|
      t.primary_key :survey_food_code
      t.string :display_name
      t.string :portion_size
      t.integer :portion_code
      t.float :grains
      t.float :whole_grains
      t.float :vegetables
      t.float :dkgreen
      t.float :orange
      t.float :starchy_vegetables
      t.float :other_vegetables
      t.float :fruits
      t.float :milk
      t.float :meat
      t.float :soy
      t.float :drybeans_peas
      t.float :oils
      t.float :solid_fats
      t.float :added_sugars
      t.float :alcohol
      t.float :calories
      t.float :saturated_fats

      t.timestamps null: false
    end
  end
end
