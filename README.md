# ror-425-example
##Overview
This Ruby on Rails app is a practice app that I used in order to play with some of the features of Rails. I may continue to add to it as I try out new Gems, but for now here are some details about the app.

Gems Utilized:
- Ruby 2.3.1
- Rails 4.2.5
- Bootstrap 3.2 (twitter-bootstrap-rails gem)
- Nokogiri
- simple_form

##Data Set & Models
In order to make the App useful, I decided to pull in a decently sized sample data set. I used a Nutrional sample data set from this website, and the XML files are under MyFoodapediaData directory:
http://usgovxml.com/dataservice.aspx?ds=USDAND

I then used the Nokogiri Gem and the Rails Console to parse the XML files, and insert the data into the database. I wrote methods to perform this from the Rails Console inside the Application Controller. If you launch the Rails Console (`rails console` at terminal), you can call the method like this: `ApplicationController.new.<method>`.

Parsing Methods:
- `parse_and_enter_model_data()`: Top level method that can be used to parse all three XML files.
  - `parse_food_xml()`: Parses the Food_Display_Table.xml file, and creates about 1000 Food entries. 

     I used `Food_Code` as the primary key, and I skip `Food_Display_Row` entries that use the same `Food_Code` identifier. I'm not sure what the purpose was in the actual data set, but since this was a practice app, I didn't worry about them. 
  - `parse_condiment_xml()`: Parses the lu_Condiment_Food_Table.xml file, and creates about 60 Condiment entries.
   
     I used the `survey_food_code` as the primary key.
  - `parse_needing_xml()`: Parses the Foods_Needing_Condiments_Table.xml file, and creates about 1000 Needing entries.

     Since this was a practice app, I wanted to play with the `Has Many Through` relationship; even though I could have used a simpler `Has Many` because there wasn't extra data fields to add into the Food -> Needing -> Condiments relationship.

