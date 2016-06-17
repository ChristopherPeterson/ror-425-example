class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def parse_food_xml
    # Use Nokogiri to open and parse the Food_Display_Table XML file
    #   Callable from the Rails Console: ApplicationController.new.parse_food_xml()
    #
    #   Skips over duplicates (Didn't need them for this sample app),
    #   so on exception during create it simply moves on to next item.

    File.open("./MyFoodapediaData/Food_Display_Table.xml") do |f|
      doc = Nokogiri::XML(f)
      items = doc.root.xpath("Food_Display_Row")
      puts items.count

      # For row in Food XML
      items.each do |row|
        puts  row.xpath("Food_Code").text + ": " + row.xpath("Display_Name").text
        begin
          Food.create(
                  :food_code => "#{row.xpath("Food_Code").text}",
                  :display_name => "#{row.xpath("Display_Name").text}",
                  :portion_default => "#{row.xpath("Portion_Default").text}",
                  :portion_amount => "#{row.xpath("Portion_Amount").text}",
                  :portion_display_name => "#{row.xpath("Portion_Display_Name").text}",
                  :factor => "#{row.xpath("Factor").text}",
                  :portion_increment => "#{row.xpath("Increment").text}",
                  :multiplier => "#{row.xpath("Multiplier").text}",
                  :grains => "#{row.xpath("Grains").text}",
                  :whole_grains => "#{row.xpath("Whole_Grains").text}",
                  :vegetables => "#{row.xpath("Vegetables").text}",
                  :orange_vegetables => "#{row.xpath("Orange_Vegetables").text}",
                  :drkgreen_vegetables => "#{row.xpath("Drkgreen_Vegetables").text}",
                  :starchy_vegetables => "#{row.xpath("Starchy_vegetables").text}",
                  :other_vegetables => "#{row.xpath("Other_Vegetables").text}",
                  :fruits => "#{row.xpath("Fruits").text}",
                  :milk => "#{row.xpath("Milk").text}",
                  :meats => "#{row.xpath("Meats").text}",
                  :soy => "#{row.xpath("Soy").text}",
                  :drybeans_peas => "#{row.xpath("Drybeans_Peas").text}",
                  :oils => "#{row.xpath("Oils").text}",
                  :solid_fats => "#{row.xpath("Solid_Fats").text}",
                  :added_sugars => "#{row.xpath("Added_Sugars").text}",
                  :alcohol => "#{row.xpath("Alcohol").text}",
                  :calories => "#{row.xpath("Calories").text}",
                  :saturated_fats => "#{row.xpath("Saturated_Fats").text}",
          )

        rescue
          puts "Error (Duplicate?)"

        end
      end # End of iterator

    end
  end
end
