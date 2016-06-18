class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def parse_and_enter_model_data
    # Use Nokogiri to parse the XML files under MyFoodapediaData,
    #   and build Database models.
    parse_food_xml()
    parse_condiment_xml()
  end

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
  end # End parse_food_xml

  def parse_condiment_xml
    # Use Nokogiri to open and parse the lu_Condiment_Food_Table XML file
    #   Callable from the Rails Console: ApplicationController.new.parse_condiment_xml()
    #
    #   Skips over duplicates (Didn't need them for this sample app),
    #   so on exception during create it simply moves on to next item.

    File.open("./MyFoodapediaData/lu_Condiment_Food_Table.xml") do |f|
      doc = Nokogiri::XML(f)
      items = doc.root.xpath("lu_Condiment_Food_Row")
      puts items.count

      # For row in Food XML
      items.each do |row|
        puts  row.xpath("survey_food_code").text + ": " + row.xpath("display_name").text
        begin
          Condiment.create(
              :survey_food_code => "#{row.xpath("survey_food_code").text}",
              :display_name => "#{row.xpath("display_name").text}",
              :portion_size => "#{row.xpath("condiment_portion_size").text}",
              :portion_code => "#{row.xpath("condiment_portion_code").text}",
              :grains => "#{row.xpath("condiment_grains").text}",
              :whole_grains => "#{row.xpath("condiment_whole_grains").text}",
              :vegetables => "#{row.xpath("condiment_vegetables").text}",
              :dkgreen => "#{row.xpath("condiment_dkgreen").text}",
              :orange => "#{row.xpath("condiment_orange").text}",
              :starchy_vegetables => "#{row.xpath("condiment_starchy_vegetables").text}",
              :other_vegetables => "#{row.xpath("condiment_other_vegetables").text}",
              :fruits => "#{row.xpath("condiment_fruits").text}",
              :milk => "#{row.xpath("condiment_milk").text}",
              :meat => "#{row.xpath("condiment_meat").text}",
              :soy => "#{row.xpath("condiment_soy").text}",
              :drybeans_peas => "#{row.xpath("condiment_drybeans_peas").text}",
              :oils => "#{row.xpath("condiment_oils").text}",
              :solid_fats => "#{row.xpath("condiment_solid_fats").text}",
              :added_sugars => "#{row.xpath("condiment_added_sugars").text}",
              :alcohol => "#{row.xpath("condiment_alcohol").text}",
              :calories => "#{row.xpath("condiment_calories").text}",
              :saturated_fats => "#{row.xpath("condiment_saturated_fats").text}",
          )

        rescue
          puts "Error (Duplicate?)"

        end
      end # End of iterator

    end
  end # End parse_condiment_xml

  def parse_needing_xml
    # Use Nokogiri to open and parse the Foods_Needing_Condiments_Table XML file
    #   Callable from the Rails Console: ApplicationController.new.parse_needing_xml()
    #
    #   Skips over duplicates (Didn't need them for this sample app),
    #   so on exception during create it simply moves on to next item.

    File.open("./MyFoodapediaData/Foods_Needing_Condiments_Table.xml") do |f|
      doc = Nokogiri::XML(f)
      items = doc.root.xpath("Foods_Needing_Condiments_Row")
      puts items.count

      # For row in Food XML
      items.each do |row|
        puts  row.xpath("Survey_Food_Code").text + ": " + row.xpath("display_name").text

        row_entries = row.xpath("*[substring(name(), string-length(name()) - 4) = '_code']")
        row_entries.each do |entry|
          puts "Needing: " + entry.text

          Needing.create(
              :food_id => "#{row.xpath("Survey_Food_Code").text}",
              :condiment_id => "#{entry.text}"
          )
        end

      end # End of iterator

    end
  end # End parse_condiment_xml
end
