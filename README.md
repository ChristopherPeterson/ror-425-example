# ror-425-example
This Ruby on Rails app is a practice app using: 
- Ruby 2.3.1
- Rails 4.2.5
- Bootstrap 3.2 (twitter-bootstrap-rails gem)
- Nokogiri gem
- simple_form gem

In order to make the App useful, I decided to pull in a decently sized sample data set. I used a Nutrional sample data set from this website, and the XML files are under MyFoodapediaData directory:
http://usgovxml.com/dataservice.aspx?ds=USDAND

I then used the Nokogiri Gem and the Rails Console to parse the XML files, and insert the data into the database. I wrote a method to perform this from the Rails Console inside the Application Controller called parse_food_xml(). If you launch the Rails Console (rails console at terminal), you can call the method like this: ApplicationController.new.parse_food_xml().
