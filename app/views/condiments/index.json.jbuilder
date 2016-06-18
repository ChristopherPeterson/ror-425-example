json.array!(@condiments) do |condiment|
  json.extract! condiment, :id, :survey_food_code, :display_name, :portion_size, :portion_code, :grains, :whole_grains, :vegetables, :dkgreen, :orange, :starchy_vegetables, :other_vegetables, :fruits, :milk, :meat, :soy, :drybeans_peas, :oils, :solid_fats, :added_sugars, :alcohol, :calories, :saturated_fats
  json.url condiment_url(condiment, format: :json)
end
