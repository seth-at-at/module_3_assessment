require "rails_helper"

RSpec.describe "return BestBuy's in our location" do
  context "by zip code" do
    
  end
end

# For this challenge you'll implement a lookup feature for storedom. We want to be able to search and return Best Buy locations in our area.
#
# We need to consume data from the BestBuy Api. Start by checking out the [BestBuy developer documentation](https://developer.bestbuy.com/). You should have received a Best Buy API key from an instructor.
#
# Once you're done getting your key, use the [Stores documentation](http://bestbuyapis.github.io/api-documentation/#stores-api) to meet the requirements below.
#
# * It's not necessary, or even advised, that you store anything in a database from the Best Buy API.
# * Display the returned stores and their attributes returned from the API query in a logical and intuitive HTML layout. (This does not need to be styled).
#
# ```
# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
# ```
